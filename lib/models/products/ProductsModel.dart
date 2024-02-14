import 'package:custom_bloc_state_management/models/BaseModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ProductsModel.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductsModel extends BaseModel {
  @JsonKey(name: "id")
  final int productID;
  @JsonKey(name: "title")
  final String productTitle;

  const ProductsModel(
      this.productID,
      this.productTitle
      );

  factory ProductsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsModelToJson(this);
}
