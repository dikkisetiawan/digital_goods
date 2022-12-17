import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'digital_goods_state.dart';

class DigitalGoodsCubit extends Cubit<DigitalGoodsState> {
  DigitalGoodsCubit() : super(DigitalGoodsInitial());
}
