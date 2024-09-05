part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

final class ProductsRequested extends ProductsEvent {}

final class ProductsRefreshRequested extends ProductsEvent {}

final class ProductByUuidRequested extends ProductsEvent {
  final String productUuid;

  const ProductByUuidRequested({required this.productUuid});

  @override
  List<Object> get props => [productUuid];
}

final class ProductsSearchUpdated extends ProductsEvent {
  final String search;

  const ProductsSearchUpdated(this.search);

  @override
  List<Object> get props => [search];
}

final class ProductsFilterRequested extends ProductsEvent {
  final String filter;

  const ProductsFilterRequested(this.filter);

  @override
  List<Object> get props => [filter];
}