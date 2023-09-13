import 'package:custom_bloc_state_management/models/resuables/ReusableContainerModel.dart';
import 'package:custom_bloc_state_management/network/response/BaseResponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'GetContainerDataModelResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class GetContainerDataModelResponse extends BaseResponse {
  @JsonKey(name: "reusables")
  final List<ReusableContainerModel> reusables;

  GetContainerDataModelResponse(
    this.reusables,
  );

  factory GetContainerDataModelResponse.fromJson(Map<String, dynamic> json) =>
      _$GetContainerDataModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetContainerDataModelResponseToJson(this);
}
