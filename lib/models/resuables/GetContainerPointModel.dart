import 'package:custom_bloc_state_management/models/BaseModel.dart';
import 'package:custom_bloc_state_management/models/resuables/GetContainerDataModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'GetContainerPointModel.g.dart';

@JsonSerializable(explicitToJson: true)
class GetContainerPointModel extends BaseModel {
  @JsonKey(name: "data")
  final GetContainerDataModel data;

  const GetContainerPointModel(
    this.data,
  );

  factory GetContainerPointModel.fromJson(Map<String, dynamic> json) =>
      _$GetContainerPointModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetContainerPointModelToJson(this);
}
