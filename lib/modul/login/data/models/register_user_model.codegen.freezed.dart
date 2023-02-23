// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_user_model.codegen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegisterUserModel _$RegisterUserModelFromJson(Map<String, dynamic> json) {
  return _RegisterUserModel.fromJson(json);
}

/// @nodoc
mixin _$RegisterUserModel {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String? get isLogin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterUserModelCopyWith<RegisterUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterUserModelCopyWith<$Res> {
  factory $RegisterUserModelCopyWith(
          RegisterUserModel value, $Res Function(RegisterUserModel) then) =
      _$RegisterUserModelCopyWithImpl<$Res, RegisterUserModel>;
  @useResult
  $Res call({String username, String password, String? isLogin});
}

/// @nodoc
class _$RegisterUserModelCopyWithImpl<$Res, $Val extends RegisterUserModel>
    implements $RegisterUserModelCopyWith<$Res> {
  _$RegisterUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? isLogin = freezed,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isLogin: freezed == isLogin
          ? _value.isLogin
          : isLogin // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegisterUserModelCopyWith<$Res>
    implements $RegisterUserModelCopyWith<$Res> {
  factory _$$_RegisterUserModelCopyWith(_$_RegisterUserModel value,
          $Res Function(_$_RegisterUserModel) then) =
      __$$_RegisterUserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String password, String? isLogin});
}

/// @nodoc
class __$$_RegisterUserModelCopyWithImpl<$Res>
    extends _$RegisterUserModelCopyWithImpl<$Res, _$_RegisterUserModel>
    implements _$$_RegisterUserModelCopyWith<$Res> {
  __$$_RegisterUserModelCopyWithImpl(
      _$_RegisterUserModel _value, $Res Function(_$_RegisterUserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? isLogin = freezed,
  }) {
    return _then(_$_RegisterUserModel(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isLogin: freezed == isLogin
          ? _value.isLogin
          : isLogin // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RegisterUserModel implements _RegisterUserModel {
  const _$_RegisterUserModel(
      {required this.username, required this.password, this.isLogin});

  factory _$_RegisterUserModel.fromJson(Map<String, dynamic> json) =>
      _$$_RegisterUserModelFromJson(json);

  @override
  final String username;
  @override
  final String password;
  @override
  final String? isLogin;

  @override
  String toString() {
    return 'RegisterUserModel(username: $username, password: $password, isLogin: $isLogin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterUserModel &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.isLogin, isLogin) || other.isLogin == isLogin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, username, password, isLogin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterUserModelCopyWith<_$_RegisterUserModel> get copyWith =>
      __$$_RegisterUserModelCopyWithImpl<_$_RegisterUserModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegisterUserModelToJson(
      this,
    );
  }
}

abstract class _RegisterUserModel implements RegisterUserModel {
  const factory _RegisterUserModel(
      {required final String username,
      required final String password,
      final String? isLogin}) = _$_RegisterUserModel;

  factory _RegisterUserModel.fromJson(Map<String, dynamic> json) =
      _$_RegisterUserModel.fromJson;

  @override
  String get username;
  @override
  String get password;
  @override
  String? get isLogin;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterUserModelCopyWith<_$_RegisterUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
