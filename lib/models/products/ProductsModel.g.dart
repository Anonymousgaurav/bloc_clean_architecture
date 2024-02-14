// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProductsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsModel _$ProductsModelFromJson(Map<String, dynamic> json) =>
    ProductsModel(
      json['id'] as int,
      json['title'] as String,
    );

Map<String, dynamic> _$ProductsModelToJson(ProductsModel instance) =>
    <String, dynamic>{
      'id': instance.productID,
      'title': instance.productTitle,
    };
