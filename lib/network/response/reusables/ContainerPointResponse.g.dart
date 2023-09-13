// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ContainerPointResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContainerPointResponse _$ContainerPointResponseFromJson(
        Map<String, dynamic> json) =>
    ContainerPointResponse(
      GetContainerDataModelResponse.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContainerPointResponseToJson(
        ContainerPointResponse instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };
