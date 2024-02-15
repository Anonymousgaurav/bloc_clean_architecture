import 'package:custom_bloc_state_management/models/BaseModel.dart';
import 'package:custom_bloc_state_management/models/products/ProductsModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'CartModel.g.dart';

@JsonSerializable(explicitToJson: true)
class CartModel extends BaseModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "products")
  final List<ProductsModel> productModel;
  @JsonKey(name: "total")
  final int total;
  @JsonKey(name: "discountedTotal")
  final int discountedTotal;
  @JsonKey(name: "userId")
  final int userID;
  @JsonKey(name: "totalProducts")
  final int totalProducts;
  @JsonKey(name: "totalQuantity")
  final int quantity;

  const CartModel(
      this.id,
      this.productModel,
      this.total,
      this.discountedTotal,
      this.userID,
      this.totalProducts,
      this.quantity
      );

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'total': total,
      'discountedTotal': discountedTotal,
      'userId': userID,
      'totalProducts': totalProducts,
      'totalQuantity': quantity,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map, List<ProductsModel> products) {
    return CartModel(
      map['id'],
      products,
      map['total'],
       map['discountedTotal'],
       map['userId'],
       map['totalProducts'],
      map['totalQuantity'],
    );
  }
}
