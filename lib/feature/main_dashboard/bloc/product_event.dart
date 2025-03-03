part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class GetProductEvent extends ProductEvent {
  const GetProductEvent();

  @override
  List<Object> get props => [];
}

class ProductDetailEvent extends ProductEvent {
  const ProductDetailEvent({
    required this.id,
  });

  final String id;

  @override
  List<Object> get props => [id];
}
