import 'package:custom_bloc_state_management/models/BaseModel.dart';
import 'package:custom_bloc_state_management/models/resuables/ReusableContainerModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'GetContainerDataModel.g.dart';

@JsonSerializable(explicitToJson: true)
class GetContainerDataModel extends BaseModel {
  @JsonKey(name: "reusables")
  final List<ReusableContainerModel> reusables;

  const GetContainerDataModel(
    this.reusables,
  );

  factory GetContainerDataModel.fromJson(Map<String, dynamic> json) =>
      _$GetContainerDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetContainerDataModelToJson(this);
}
