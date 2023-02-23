import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_user_model.codegen.freezed.dart';
part 'register_user_model.codegen.g.dart';

@freezed
class RegisterUserModel with _$RegisterUserModel {
  const factory RegisterUserModel({
    required String username,
    required String password,
    String? isLogin
  }) = _RegisterUserModel;

  factory RegisterUserModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserModelFromJson(json);

}