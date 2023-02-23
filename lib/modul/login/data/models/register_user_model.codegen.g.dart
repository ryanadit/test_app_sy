// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_user_model.codegen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegisterUserModel _$$_RegisterUserModelFromJson(Map<String, dynamic> json) =>
    _$_RegisterUserModel(
      username: json['username'] as String,
      password: json['password'] as String,
      isLogin: json['isLogin'] as String?,
    );

Map<String, dynamic> _$$_RegisterUserModelToJson(
        _$_RegisterUserModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'isLogin': instance.isLogin,
    };
