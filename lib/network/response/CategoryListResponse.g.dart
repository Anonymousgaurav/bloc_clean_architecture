// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CategoryListResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryListResponse _$CategoryListResponseFromJson(
        Map<String, dynamic> json) =>
    CategoryListResponse(
      (json['carts'] as List<dynamic>)
          .map((e) => CartModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total'] as int,
      json['skip'] as int,
      json['limit'] as int,
    );

Map<String, dynamic> _$CategoryListResponseToJson(
        CategoryListResponse instance) =>
    <String, dynamic>{
      'carts': instance.charts.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
    };
