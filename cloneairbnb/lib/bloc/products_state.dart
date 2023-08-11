part of 'products_bloc.dart';

@immutable
abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object?> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<Product> allProducts;

  const ProductsLoaded(this.allProducts);
}

class ProductsError extends ProductsState {
  final String? err;

  ProductsError(this.err);
}
