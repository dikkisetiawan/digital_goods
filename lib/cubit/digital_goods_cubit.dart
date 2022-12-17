import 'package:digital_goods/models/goods_model.dart';
import 'package:digital_goods/models/user_model.dart';
import 'package:digital_goods/services/digital_goods_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_cubit.dart';

part 'digital_goods_state.dart';

class DigitalGoodsCubit extends Cubit<DigitalGoodsState> {
  DigitalGoodsCubit() : super(DigitalGoodsInitial());

  static int? selectedProductId;

  void fetchDigitalGoodsList() async {
    try {
      emit(DigitalGoodsLoading());
      print('fetchDigitalGoodsList cubit loading passed');

      DigitalGoodsModel digitalGoodsData = await DigitalGoodsService()
          .fetchDigitalGoods(token: AuthCubit.loginData.accessToken!);
      print('fetchDigitalGoodsList cubit service passed');
      emit(DigitalGoodsSuccess(digitalGoodsData));
    } catch (e) {
      emit(DigitalGoodsFailed(e.toString()));
    }
  }
}
