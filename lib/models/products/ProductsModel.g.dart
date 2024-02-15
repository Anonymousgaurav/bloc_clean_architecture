// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProductsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsModel _$ProductsModelFromJson(Map<String, dynamic> json) =>
    ProductsModel(
      json['id'] as int,
      json['title'] as String,
      (json['price'] as num).toDouble(),
      json['quantity'] as int,
      (json['total'] as num).toDouble(),
      (json['discountPercentage'] as num).toDouble(),
      (json['discountedPrice'] as num).toDouble(),
      json['thumbnail'] as String,
    );

Map<String, dynamic> _$ProductsModelToJson(ProductsModel instance) =>
    <String, dynamic>{
      'id': instance.productID,
      'title': instance.productTitle,
      'price': instance.productPrice,
      'quantity': instance.productQuantity,
      'total': instance.total,
      'discountPercentage': instance.discountedPercentage,
      'discountedPrice': instance.discountedPrice,
      'thumbnail': instance.thumbnailProduct,
    };
