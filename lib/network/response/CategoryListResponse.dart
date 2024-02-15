import 'package:custom_bloc_state_management/models/products/CartModel.dart';
import 'package:json_annotation/json_annotation.dart';

import 'BaseResponse.dart';

part 'CategoryListResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryListResponse implements BaseResponse {
  @JsonKey(name: "carts")
  final List<CartModel> charts;
  @JsonKey(name: "total")
  final int total;
  @JsonKey(name: "skip")
  final int skip;
  @JsonKey(name: "limit")
  final int limit;

  CategoryListResponse(this.charts, this.total,this.skip,this.limit);

  factory CategoryListResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryListResponseToJson(this);
}
