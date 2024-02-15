import 'package:custom_bloc_state_management/models/dto/BaseDTO.dart';
import 'package:custom_bloc_state_management/models/products/CartModel.dart';
import 'package:custom_bloc_state_management/models/session/SessionModel.dart';

class LocalCartDTO extends BaseDTO {
  List<CartModel> cartModel;

  LocalCartDTO({required this.cartModel}) : super();
}
