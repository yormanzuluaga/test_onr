import 'package:api_helper/api_helper.dart';
import 'package:api_repository/api_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({
    required ProductRepository productRepository,
  })  : _productRepository = productRepository,
        super(ProductState()) {
    on<ProductEvent>((event, emit) {});

    on<GetProductEvent>((event, emit) async {
      final result = await _productRepository.getProduct();

      result.fold((l) {}, (r) {
        emit(state.copyWith(listProduct: r));
      });
    });

    on<ProductDetailEvent>((event, emit) async {
      final result = await _productRepository.getProductDetail(
        id: event.id,
      );

      result.fold((l) {}, (r) {
        emit(state.copyWith(product: r));
      });
    });
  }

  final ProductRepository _productRepository;
}
