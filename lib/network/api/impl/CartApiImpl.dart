import 'dart:convert';

import 'package:basic_utils/basic_utils.dart';
import 'package:custom_bloc_state_management/network/ICartListApi.dart';
import 'package:custom_bloc_state_management/network/response/CategoryListResponse.dart';
import '../../NetConfig.dart';
import '../BaseApi.dart';

class CartApiImpl extends BaseApi
    implements ICartListApi {
  const CartApiImpl() : super();

  @override
  Future<CategoryListResponse?> getCartLists() async {
      final URL = NetConfig.getProductCarts();
      final resp = await HttpUtils.getForFullResponse(URL);
      if (this.isSuccessful(resp)) {
        print('network calll>>>');
        return CategoryListResponse.fromJson(jsonDecode(resp.body));
      } else if (this.isNotAuthorized(resp)) {
        this.throwUnauthorized();
      } else {
        this.throwNetError(URL);
      }
  }

}
