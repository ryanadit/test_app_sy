import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.codegen.freezed.dart';
part 'user_model.codegen.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String username,
    required String password,
    String? isLogin
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

}