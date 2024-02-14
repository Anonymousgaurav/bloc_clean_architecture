import 'dart:convert';

import 'package:basic_utils/basic_utils.dart';
import 'package:custom_bloc_state_management/network/NetConfig.dart';
import 'package:custom_bloc_state_management/network/api/BaseApi.dart';
import 'package:custom_bloc_state_management/network/api/IGetProductsApi.dart';
import 'package:custom_bloc_state_management/network/response/products/ProductsResponse.dart';

class ProductsApiImpl extends BaseApi implements IGetProductsApi {
  const ProductsApiImpl() : super();

  @override
  Future<ProductsResponse?> getProducts() async {
    final URL = NetConfig.getAllProducts();
    final resp = await HttpUtils.getForFullResponse(URL);
    if (this.isSuccessful(resp)) {
      return ProductsResponse.fromJson(jsonDecode(resp.body));
    } else if (this.isNotAuthorized(resp)) {
      this.throwUnauthorized();
    } else {
      this.throwNetError(URL);
    }
  }
}
