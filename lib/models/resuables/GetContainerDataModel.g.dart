// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetContainerDataModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetContainerDataModel _$GetContainerDataModelFromJson(
        Map<String, dynamic> json) =>
    GetContainerDataModel(
      (json['reusables'] as List<dynamic>)
          .map(
              (e) => ReusableContainerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetContainerDataModelToJson(
        GetContainerDataModel instance) =>
    <String, dynamic>{
      'reusables': instance.reusables.map((e) => e.toJson()).toList(),
    };
