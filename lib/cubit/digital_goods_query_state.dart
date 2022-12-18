part of 'digital_goods_query_cubit.dart';

abstract class DigitalGoodsQueryState extends Equatable {
  const DigitalGoodsQueryState();

  @override
  List<Object> get props => [];
}

class DigitalGoodsQueryInitial extends DigitalGoodsQueryState {}

class FilterBrandsByPrefixLoading extends DigitalGoodsQueryState {}

class FilterBrandsByPrefixSuccess extends DigitalGoodsQueryState {
  final BrandModel filteredBrandsByPrefix;

  const FilterBrandsByPrefixSuccess(this.filteredBrandsByPrefix);

  @override
  List<Object> get props => [filteredBrandsByPrefix];
}

class FilterBrandsByPrefixFailed extends DigitalGoodsQueryState {
  final String error;

  const FilterBrandsByPrefixFailed(this.error);

  @override
  List<Object> get props => [error];
}
