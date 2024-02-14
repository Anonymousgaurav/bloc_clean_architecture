import 'package:custom_bloc_state_management/models/products/ProductsModel.dart';

abstract class ProductsRepo {
  Future<List<ProductsModel>> getProducts();
}
