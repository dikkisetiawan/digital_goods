import '/models/goods_model.dart';
import '/services/digital_goods_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_cubit.dart';

part 'digital_goods_state.dart';

class DigitalGoodsCubit extends Cubit<DigitalGoodsState> {
  DigitalGoodsCubit() : super(DigitalGoodsInitial());

  static int? selectedProductId;
  static late DigitalGoodsModel digitalGoodsData;

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
}
