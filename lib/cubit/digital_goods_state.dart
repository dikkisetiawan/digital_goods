part of 'digital_goods_cubit.dart';

abstract class DigitalGoodsState {}

class DigitalGoodsInitial extends DigitalGoodsState {}

class DigitalGoodsLoading extends DigitalGoodsState {}

class FilterBrandsByPrefixLoading extends DigitalGoodsState {}

class FilterBrandsByPrefixSuccess extends DigitalGoodsState {
  final BrandModel filteredBrandsByPrefix;

  FilterBrandsByPrefixSuccess(this.filteredBrandsByPrefix);

  @override
  List<Object> get props => [filteredBrandsByPrefix];
}

class FilterBrandsByPrefixFailed extends DigitalGoodsState {
  final String error;

  FilterBrandsByPrefixFailed(this.error);

  @override
  List<Object> get props => [error];
}

class DigitalGoodsSuccess extends DigitalGoodsState {
  final DigitalGoodsModel digitalGoodsData;

  DigitalGoodsSuccess(this.digitalGoodsData);

  @override
  List<Object> get props => [digitalGoodsData];
}

class DigitalGoodsFailed extends DigitalGoodsState {
  final String error;

  DigitalGoodsFailed(this.error);

  @override
  List<Object> get props => [error];
}
