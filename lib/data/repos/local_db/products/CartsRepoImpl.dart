import 'package:custom_bloc_state_management/business/repos/local_db/ILocalCartRepo.dart';
import 'package:custom_bloc_state_management/data/exception/DataException.dart';
import 'package:custom_bloc_state_management/database/dao/CartDAO.dart';
import 'package:custom_bloc_state_management/models/products/CartModel.dart';
import 'package:custom_bloc_state_management/network/ICartListApi.dart';
import 'package:custom_bloc_state_management/network/api/impl/CartApiImpl.dart';

const String TAG = "CartsRepoImpl";

class CartsRepoImpl implements ILocalCartRepo {
  static const int TARGET_ID = 1;

  CartsRepoImpl();

   ICartListApi api = CartApiImpl();
   CartDAO cartDAO = CartDAO();

  @override
  Future<bool> insertCart({List<CartModel>? cartModel}) async {
     await cartDAO.insertCart(cartList: cartModel!);
     return true;
  }

  @override
  Future<List<CartModel>> getLocalCartList() async {
    return await cartDAO.getAllCarts();
  }

  @override
  Future<List<CartModel>> getProductList() async{
    try {
      var resp = await this.api.getCartLists();
      return resp!.charts;
    } on Exception {
      throw DataException();
    }
  }
}
