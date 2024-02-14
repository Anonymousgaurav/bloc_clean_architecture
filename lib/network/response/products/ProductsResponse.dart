import 'package:custom_bloc_state_management/models/products/ProductsModel.dart';
import 'package:custom_bloc_state_management/network/response/BaseResponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ProductsResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductsResponse extends BaseResponse {
  @JsonKey(name: "products")
  final List<ProductsModel> data;

  ProductsResponse(
    this.data,
  );

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);
}
