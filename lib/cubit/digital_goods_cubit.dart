import '/models/goods_model.dart';
import '/services/digital_goods_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';

import 'auth_cubit.dart';

part 'digital_goods_state.dart';

class DigitalGoodsCubit extends Cubit<DigitalGoodsState> {
  DigitalGoodsCubit() : super(DigitalGoodsInitial());

  static int? selectedProductId;
  late DigitalGoodsModel digitalGoodsData;

  void fetchDigitalGoodsList() async {
    try {
      emit(DigitalGoodsLoading());

      digitalGoodsData = await DigitalGoodsService()
          .fetchDigitalGoods(token: AuthCubit.loginData!.accessToken!);

      emit(DigitalGoodsSuccess(digitalGoodsData));
    } catch (e) {
      emit(DigitalGoodsFailed(e.toString()));
    }
  }

  void filterBrandsByPrefix({required String destination}) {
    if (destination.length == 4) {
      try {
        emit(FilterBrandsByPrefixLoading());

        BrandModel filteredBrandsByPrefix = getBrandsByPrefix(destination)!;

        emit(FilterBrandsByPrefixSuccess(filteredBrandsByPrefix));
      } catch (e) {
        print(e);
        emit(FilterBrandsByPrefixFailed(e.toString()));
      }
    } else if (destination.length < 4) {
      emit(DigitalGoodsSuccess(digitalGoodsData));
    }
  }

  BrandModel? getBrandsByPrefix(String destination) {
    return digitalGoodsData.prepaid![getIndexOf()].brands!
        .singleWhereOrNull((x) => filterDestinationByPrefix(x, destination));
  }

  int getIndexOf() {
    return digitalGoodsData.prepaid!
        .indexWhere((x) => x.name!.toLowerCase().contains('pulsa'));
  }

  bool filterDestinationByPrefix(BrandModel x, String destination) {
    return x.prefixes!.contains(destination.substring(0, 4));
  }
}
