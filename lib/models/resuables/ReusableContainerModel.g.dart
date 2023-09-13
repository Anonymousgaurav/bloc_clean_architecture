// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ReusableContainerModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReusableContainerModel _$ReusableContainerModelFromJson(
        Map<String, dynamic> json) =>
    ReusableContainerModel(
      json['id'] as int,
      json['name'] as String,
      json['icon_url'] as String,
      json['price'] as String,
      json['type'] as String,
    );

Map<String, dynamic> _$ReusableContainerModelToJson(
        ReusableContainerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon_url': instance.icon_url,
      'type': instance.type,
      'price': instance.price,
    };
