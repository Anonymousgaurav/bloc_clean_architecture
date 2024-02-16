import 'package:custom_bloc_state_management/models/BaseModel.dart';
import 'package:json_annotation/json_annotation.dart';


part 'ProductsModel.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductsModel extends BaseModel {
  @JsonKey(name: "id")
  final int productID;
  @JsonKey(name: "title")
  final String productTitle;
  @JsonKey(name: "price")
  final double productPrice;
  @JsonKey(name: "quantity")
  final int productQuantity;
  @JsonKey(name: "total")
  final double total;
  @JsonKey(name: "discountPercentage")
  final double discountedPercentage;
  @JsonKey(name: "discountedPrice")
  final double discountedPrice;
  @JsonKey(name: "thumbnail")
  final String thumbnailProduct;
  String? localThumbnail;

   ProductsModel(
      this.productID,
      this.productTitle,
      this.productPrice,
      this.productQuantity,
      this.total,
      this.discountedPercentage,
      this.discountedPrice,
      this.thumbnailProduct,
     this.localThumbnail
      );

  factory ProductsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsModelToJson(this);

  Map<String, dynamic> toMap() {
    return {
      'title': productTitle,
      'price': productPrice,
      'quantity': productQuantity,
      'total': total,
      'discountPercentage': discountedPercentage,
      'discountedPrice': discountedPrice,
      'thumbnail':  thumbnailProduct,
      'localThumbnail' : localThumbnail
    };
  }

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
       map['id'] ,
       map['title'],
       map['price'],
       map['quantity'],
       map['total'],
       map['discountPercentage'],
       map['discountedPrice'],
       map['thumbnail'],
      map['localThumbnail'], // add this line
    );
  }
}
