// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() visiblePasswordMethod,
    required TResult Function(String email, String password) registerEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? visiblePasswordMethod,
    TResult? Function(String email, String password)? registerEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? visiblePasswordMethod,
    TResult Function(String email, String password)? registerEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_VisiblePasswordMethodEvent value)
        visiblePasswordMethod,
    required TResult Function(_RegisterEvent value) registerEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_VisiblePasswordMethodEvent value)? visiblePasswordMethod,
    TResult? Function(_RegisterEvent value)? registerEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VisiblePasswordMethodEvent value)? visiblePasswordMethod,
    TResult Function(_RegisterEvent value)? registerEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterEventCopyWith<$Res> {
  factory $RegisterEventCopyWith(
          RegisterEvent value, $Res Function(RegisterEvent) then) =
      _$RegisterEventCopyWithImpl<$Res, RegisterEvent>;
}

/// @nodoc
class _$RegisterEventCopyWithImpl<$Res, $Val extends RegisterEvent>
    implements $RegisterEventCopyWith<$Res> {
  _$RegisterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_VisiblePasswordMethodEventCopyWith<$Res> {
  factory _$$_VisiblePasswordMethodEventCopyWith(
          _$_VisiblePasswordMethodEvent value,
          $Res Function(_$_VisiblePasswordMethodEvent) then) =
      __$$_VisiblePasswordMethodEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_VisiblePasswordMethodEventCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$_VisiblePasswordMethodEvent>
    implements _$$_VisiblePasswordMethodEventCopyWith<$Res> {
  __$$_VisiblePasswordMethodEventCopyWithImpl(
      _$_VisiblePasswordMethodEvent _value,
      $Res Function(_$_VisiblePasswordMethodEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_VisiblePasswordMethodEvent implements _VisiblePasswordMethodEvent {
  const _$_VisiblePasswordMethodEvent();

  @override
  String toString() {
    return 'RegisterEvent.visiblePasswordMethod()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VisiblePasswordMethodEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() visiblePasswordMethod,
    required TResult Function(String email, String password) registerEvent,
  }) {
    return visiblePasswordMethod();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? visiblePasswordMethod,
    TResult? Function(String email, String password)? registerEvent,
  }) {
    return visiblePasswordMethod?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? visiblePasswordMethod,
    TResult Function(String email, String password)? registerEvent,
    required TResult orElse(),
  }) {
    if (visiblePasswordMethod != null) {
      return visiblePasswordMethod();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_VisiblePasswordMethodEvent value)
        visiblePasswordMethod,
    required TResult Function(_RegisterEvent value) registerEvent,
  }) {
    return visiblePasswordMethod(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_VisiblePasswordMethodEvent value)? visiblePasswordMethod,
    TResult? Function(_RegisterEvent value)? registerEvent,
  }) {
    return visiblePasswordMethod?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VisiblePasswordMethodEvent value)? visiblePasswordMethod,
    TResult Function(_RegisterEvent value)? registerEvent,
    required TResult orElse(),
  }) {
    if (visiblePasswordMethod != null) {
      return visiblePasswordMethod(this);
    }
    return orElse();
  }
}

abstract class _VisiblePasswordMethodEvent implements RegisterEvent {
  const factory _VisiblePasswordMethodEvent() = _$_VisiblePasswordMethodEvent;
}

/// @nodoc
abstract class _$$_RegisterEventCopyWith<$Res> {
  factory _$$_RegisterEventCopyWith(
          _$_RegisterEvent value, $Res Function(_$_RegisterEvent) then) =
      __$$_RegisterEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$_RegisterEventCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$_RegisterEvent>
    implements _$$_RegisterEventCopyWith<$Res> {
  __$$_RegisterEventCopyWithImpl(
      _$_RegisterEvent _value, $Res Function(_$_RegisterEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$_RegisterEvent(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RegisterEvent implements _RegisterEvent {
  const _$_RegisterEvent(this.email, this.password);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'RegisterEvent.registerEvent(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterEvent &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterEventCopyWith<_$_RegisterEvent> get copyWith =>
      __$$_RegisterEventCopyWithImpl<_$_RegisterEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() visiblePasswordMethod,
    required TResult Function(String email, String password) registerEvent,
  }) {
    return registerEvent(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? visiblePasswordMethod,
    TResult? Function(String email, String password)? registerEvent,
  }) {
    return registerEvent?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? visiblePasswordMethod,
    TResult Function(String email, String password)? registerEvent,
    required TResult orElse(),
  }) {
    if (registerEvent != null) {
      return registerEvent(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_VisiblePasswordMethodEvent value)
        visiblePasswordMethod,
    required TResult Function(_RegisterEvent value) registerEvent,
  }) {
    return registerEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_VisiblePasswordMethodEvent value)? visiblePasswordMethod,
    TResult? Function(_RegisterEvent value)? registerEvent,
  }) {
    return registerEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VisiblePasswordMethodEvent value)? visiblePasswordMethod,
    TResult Function(_RegisterEvent value)? registerEvent,
    required TResult orElse(),
  }) {
    if (registerEvent != null) {
      return registerEvent(this);
    }
    return orElse();
  }
}

abstract class _RegisterEvent implements RegisterEvent {
  const factory _RegisterEvent(final String email, final String password) =
      _$_RegisterEvent;

  String get email;
  String get password;
  @JsonKey(ignore: true)
  _$$_RegisterEventCopyWith<_$_RegisterEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegisterState {
  bool? get statusRegister => throw _privateConstructorUsedError;
  bool? get usernameExistBool => throw _privateConstructorUsedError;
  RegisterStatus get registerStatus => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  bool? get visiblePasswordBool => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterStateCopyWith<RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) then) =
      _$RegisterStateCopyWithImpl<$Res, RegisterState>;
  @useResult
  $Res call(
      {bool? statusRegister,
      bool? usernameExistBool,
      RegisterStatus registerStatus,
      String? message,
      bool? visiblePasswordBool});
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res, $Val extends RegisterState>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusRegister = freezed,
    Object? usernameExistBool = freezed,
    Object? registerStatus = null,
    Object? message = freezed,
    Object? visiblePasswordBool = freezed,
  }) {
    return _then(_value.copyWith(
      statusRegister: freezed == statusRegister
          ? _value.statusRegister
          : statusRegister // ignore: cast_nullable_to_non_nullable
              as bool?,
      usernameExistBool: freezed == usernameExistBool
          ? _value.usernameExistBool
          : usernameExistBool // ignore: cast_nullable_to_non_nullable
              as bool?,
      registerStatus: null == registerStatus
          ? _value.registerStatus
          : registerStatus // ignore: cast_nullable_to_non_nullable
              as RegisterStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      visiblePasswordBool: freezed == visiblePasswordBool
          ? _value.visiblePasswordBool
          : visiblePasswordBool // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegisterStateCopyWith<$Res>
    implements $RegisterStateCopyWith<$Res> {
  factory _$$_RegisterStateCopyWith(
          _$_RegisterState value, $Res Function(_$_RegisterState) then) =
      __$$_RegisterStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? statusRegister,
      bool? usernameExistBool,
      RegisterStatus registerStatus,
      String? message,
      bool? visiblePasswordBool});
}

/// @nodoc
class __$$_RegisterStateCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$_RegisterState>
    implements _$$_RegisterStateCopyWith<$Res> {
  __$$_RegisterStateCopyWithImpl(
      _$_RegisterState _value, $Res Function(_$_RegisterState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusRegister = freezed,
    Object? usernameExistBool = freezed,
    Object? registerStatus = null,
    Object? message = freezed,
    Object? visiblePasswordBool = freezed,
  }) {
    return _then(_$_RegisterState(
      statusRegister: freezed == statusRegister
          ? _value.statusRegister
          : statusRegister // ignore: cast_nullable_to_non_nullable
              as bool?,
      usernameExistBool: freezed == usernameExistBool
          ? _value.usernameExistBool
          : usernameExistBool // ignore: cast_nullable_to_non_nullable
              as bool?,
      registerStatus: null == registerStatus
          ? _value.registerStatus
          : registerStatus // ignore: cast_nullable_to_non_nullable
              as RegisterStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      visiblePasswordBool: freezed == visiblePasswordBool
          ? _value.visiblePasswordBool
          : visiblePasswordBool // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_RegisterState implements _RegisterState {
  _$_RegisterState(
      {required this.statusRegister,
      required this.usernameExistBool,
      required this.registerStatus,
      this.message,
      this.visiblePasswordBool});

  @override
  final bool? statusRegister;
  @override
  final bool? usernameExistBool;
  @override
  final RegisterStatus registerStatus;
  @override
  final String? message;
  @override
  final bool? visiblePasswordBool;

  @override
  String toString() {
    return 'RegisterState(statusRegister: $statusRegister, usernameExistBool: $usernameExistBool, registerStatus: $registerStatus, message: $message, visiblePasswordBool: $visiblePasswordBool)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterState &&
            (identical(other.statusRegister, statusRegister) ||
                other.statusRegister == statusRegister) &&
            (identical(other.usernameExistBool, usernameExistBool) ||
                other.usernameExistBool == usernameExistBool) &&
            (identical(other.registerStatus, registerStatus) ||
                other.registerStatus == registerStatus) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.visiblePasswordBool, visiblePasswordBool) ||
                other.visiblePasswordBool == visiblePasswordBool));
  }

  @override
  int get hashCode => Object.hash(runtimeType, statusRegister,
      usernameExistBool, registerStatus, message, visiblePasswordBool);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterStateCopyWith<_$_RegisterState> get copyWith =>
      __$$_RegisterStateCopyWithImpl<_$_RegisterState>(this, _$identity);
}

abstract class _RegisterState implements RegisterState {
  factory _RegisterState(
      {required final bool? statusRegister,
      required final bool? usernameExistBool,
      required final RegisterStatus registerStatus,
      final String? message,
      final bool? visiblePasswordBool}) = _$_RegisterState;

  @override
  bool? get statusRegister;
  @override
  bool? get usernameExistBool;
  @override
  RegisterStatus get registerStatus;
  @override
  String? get message;
  @override
  bool? get visiblePasswordBool;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterStateCopyWith<_$_RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}
