import 'package:custom_bloc_state_management/network/request/BaseRequest.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ContainerPointRequest.g.dart';

@JsonSerializable(explicitToJson: true)
class ContainerPointRequest implements BaseRequest {
  @JsonKey(name: "id")
  final int id;

  ContainerPointRequest(this.id) : super();

  factory ContainerPointRequest.fromJson(Map<String, dynamic> json) =>
      _$ContainerPointRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerPointRequestToJson(this);
}
