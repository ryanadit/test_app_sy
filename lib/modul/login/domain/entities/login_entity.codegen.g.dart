// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_entity.codegen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginEntity _$$_LoginEntityFromJson(Map<String, dynamic> json) =>
    _$_LoginEntity(
      username: json['username'] as String,
      password: json['password'] as String,
      isLogin: json['isLogin'] as String?,
    );

Map<String, dynamic> _$$_LoginEntityToJson(_$_LoginEntity instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'isLogin': instance.isLogin,
    };
