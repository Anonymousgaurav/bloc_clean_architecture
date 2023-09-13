import 'package:custom_bloc_state_management/network/response/BaseResponse.dart';
import 'package:custom_bloc_state_management/network/response/reusables/GetContainerDataModelResponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ContainerPointResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class ContainerPointResponse extends BaseResponse {
  @JsonKey(name: "data")
  final GetContainerDataModelResponse data;

  ContainerPointResponse(
    this.data,
  );

  factory ContainerPointResponse.fromJson(Map<String, dynamic> json) =>
      _$ContainerPointResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerPointResponseToJson(this);
}
