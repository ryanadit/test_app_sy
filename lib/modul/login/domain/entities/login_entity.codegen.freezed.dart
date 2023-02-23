// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_entity.codegen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginEntity _$LoginEntityFromJson(Map<String, dynamic> json) {
  return _LoginEntity.fromJson(json);
}

/// @nodoc
mixin _$LoginEntity {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String? get isLogin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginEntityCopyWith<LoginEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEntityCopyWith<$Res> {
  factory $LoginEntityCopyWith(
          LoginEntity value, $Res Function(LoginEntity) then) =
      _$LoginEntityCopyWithImpl<$Res, LoginEntity>;
  @useResult
  $Res call({String username, String password, String? isLogin});
}

/// @nodoc
class _$LoginEntityCopyWithImpl<$Res, $Val extends LoginEntity>
    implements $LoginEntityCopyWith<$Res> {
  _$LoginEntityCopyWithImpl(this._value, this._then);

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
abstract class _$$_LoginEntityCopyWith<$Res>
    implements $LoginEntityCopyWith<$Res> {
  factory _$$_LoginEntityCopyWith(
          _$_LoginEntity value, $Res Function(_$_LoginEntity) then) =
      __$$_LoginEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String password, String? isLogin});
}

/// @nodoc
class __$$_LoginEntityCopyWithImpl<$Res>
    extends _$LoginEntityCopyWithImpl<$Res, _$_LoginEntity>
    implements _$$_LoginEntityCopyWith<$Res> {
  __$$_LoginEntityCopyWithImpl(
      _$_LoginEntity _value, $Res Function(_$_LoginEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? isLogin = freezed,
  }) {
    return _then(_$_LoginEntity(
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
class _$_LoginEntity implements _LoginEntity {
  const _$_LoginEntity(
      {required this.username, required this.password, this.isLogin});

  factory _$_LoginEntity.fromJson(Map<String, dynamic> json) =>
      _$$_LoginEntityFromJson(json);

  @override
  final String username;
  @override
  final String password;
  @override
  final String? isLogin;

  @override
  String toString() {
    return 'LoginEntity(username: $username, password: $password, isLogin: $isLogin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginEntity &&
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
  _$$_LoginEntityCopyWith<_$_LoginEntity> get copyWith =>
      __$$_LoginEntityCopyWithImpl<_$_LoginEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginEntityToJson(
      this,
    );
  }
}

abstract class _LoginEntity implements LoginEntity {
  const factory _LoginEntity(
      {required final String username,
      required final String password,
      final String? isLogin}) = _$_LoginEntity;

  factory _LoginEntity.fromJson(Map<String, dynamic> json) =
      _$_LoginEntity.fromJson;

  @override
  String get username;
  @override
  String get password;
  @override
  String? get isLogin;
  @override
  @JsonKey(ignore: true)
  _$$_LoginEntityCopyWith<_$_LoginEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
