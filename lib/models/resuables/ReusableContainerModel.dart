import 'package:custom_bloc_state_management/models/BaseModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ReusableContainerModel.g.dart';

@JsonSerializable(explicitToJson: true)
class ReusableContainerModel implements BaseModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "icon_url")
  final String icon_url;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "price")
  final String price;

  ReusableContainerModel(
      this.id, this.name, this.icon_url, this.price, this.type);

  factory ReusableContainerModel.fromJson(Map<String, dynamic> json) =>
      _$ReusableContainerModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReusableContainerModelToJson(this);
}
