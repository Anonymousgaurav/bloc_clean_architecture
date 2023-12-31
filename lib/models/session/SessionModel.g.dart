// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SessionModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionModel _$SessionModelFromJson(Map<String, dynamic> json) => SessionModel(
      mail: json['email'] as String?,
      display: json['name'] as String?,
      pic: json['image_url'] as String?,
      token: json['token'] as String?,
      newUser: json['newUser'] as bool? ?? false,
      mailValidationDone: json['mailValidationDone'] as bool? ?? true,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$SessionModelToJson(SessionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.mail,
      'image_url': instance.pic,
      'token': instance.token,
      'name': instance.display,
      'mailValidationDone': instance.mailValidationDone,
      'newUser': instance.newUser,
    };
