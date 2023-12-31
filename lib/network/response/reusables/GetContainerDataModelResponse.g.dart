// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetContainerDataModelResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetContainerDataModelResponse _$GetContainerDataModelResponseFromJson(
        Map<String, dynamic> json) =>
    GetContainerDataModelResponse(
      (json['reusables'] as List<dynamic>)
          .map(
              (e) => ReusableContainerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetContainerDataModelResponseToJson(
        GetContainerDataModelResponse instance) =>
    <String, dynamic>{
      'reusables': instance.reusables,
    };
