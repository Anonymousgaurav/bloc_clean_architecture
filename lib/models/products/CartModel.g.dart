// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CartModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      json['id'] as int,
      (json['products'] as List<dynamic>)
          .map((e) => ProductsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total'] as int,
      json['discountedTotal'] as int,
      json['userId'] as int,
      json['totalProducts'] as int,
      json['totalQuantity'] as int,
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'id': instance.id,
      'products': instance.productModel.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'discountedTotal': instance.discountedTotal,
      'userId': instance.userID,
      'totalProducts': instance.totalProducts,
      'totalQuantity': instance.quantity,
    };
