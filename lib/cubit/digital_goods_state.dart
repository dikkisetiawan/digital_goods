part of 'digital_goods_cubit.dart';

abstract class DigitalGoodsState {}

class DigitalGoodsInitial extends DigitalGoodsState {}

class DigitalGoodsLoading extends DigitalGoodsState {}

class DigitalGoodsSuccess extends DigitalGoodsState {
  final DigitalGoodsModel digitalGoodsData;

  DigitalGoodsSuccess(this.digitalGoodsData);

  List<Object> get props => [digitalGoodsData];
}

class DigitalGoodsFailed extends DigitalGoodsState {
  final String error;

  DigitalGoodsFailed(this.error);

  List<Object> get props => [error];
}
