import 'package:custom_bloc_state_management/network/response/products/ProductsResponse.dart';

abstract class IGetProductsApi {
  Future<ProductsResponse?> getProducts();
}
