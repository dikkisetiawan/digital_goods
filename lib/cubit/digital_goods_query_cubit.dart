// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:digital_goods/cubit/digital_goods_cubit.dart';
import 'package:equatable/equatable.dart';

import '../models/goods_model.dart';

part 'digital_goods_query_state.dart';

class DigitalGoodsQueryCubit extends Cubit<DigitalGoodsQueryState> {
  DigitalGoodsQueryCubit() : super(DigitalGoodsQueryInitial());

  void filterBrandsByPrefix({required String destination}) {
    if (destination.length == 4) {
      try {
        emit(FilterBrandsByPrefixLoading());

        BrandModel filteredBrandsByPrefix = getBrandsByPrefix(destination)!;

        emit(FilterBrandsByPrefixSuccess(filteredBrandsByPrefix));
      } catch (e) {
        emit(FilterBrandsByPrefixFailed(e.toString()));
      }
    } else if (destination.length < 4) {
      emit(DigitalGoodsQueryInitial());
    }
  }

  BrandModel? getBrandsByPrefix(String destination) {
    return DigitalGoodsCubit.digitalGoodsData.prepaid![getIndexOf()].brands!
        .singleWhereOrNull((x) => filterDestinationByPrefix(x, destination));
  }

  int getIndexOf() {
    return DigitalGoodsCubit.digitalGoodsData.prepaid!
        .indexWhere((x) => x.name!.toLowerCase().contains('pulsa'));
  }

  bool filterDestinationByPrefix(BrandModel x, String destination) {
    return x.prefixes!.contains(destination.substring(0, 4));
  }
}
