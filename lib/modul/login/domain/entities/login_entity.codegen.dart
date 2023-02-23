import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_entity.codegen.freezed.dart';
part 'login_entity.codegen.g.dart';

@freezed
class LoginEntity with _$LoginEntity {
  const factory LoginEntity({
    required String username,
    required String password,
    String? isLogin
  }) = _LoginEntity;

  factory LoginEntity.fromJson(Map<String, dynamic> json) =>
      _$LoginEntityFromJson(json);

}