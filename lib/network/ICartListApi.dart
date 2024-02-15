import 'package:custom_bloc_state_management/network/response/CategoryListResponse.dart';

abstract class ICartListApi {
  Future<CategoryListResponse?> getCartLists();
}
