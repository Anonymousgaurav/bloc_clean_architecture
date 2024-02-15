import 'package:custom_bloc_state_management/models/products/CartModel.dart';

abstract class ILocalCartRepo {
  Future<bool> insertCart({List<CartModel> cartModel});
  Future<List<CartModel>> getLocalCartList();
  Future<List<CartModel>> getProductList();

}
