// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'date_model.codegen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DateModel _$DateModelFromJson(Map<String, dynamic> json) {
  return _DateModel.fromJson(json);
}

/// @nodoc
mixin _$DateModel {
  String get input => throw _privateConstructorUsedError;
  String get dateTime => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DateModelCopyWith<DateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DateModelCopyWith<$Res> {
  factory $DateModelCopyWith(DateModel value, $Res Function(DateModel) then) =
      _$DateModelCopyWithImpl<$Res, DateModel>;
  @useResult
  $Res call({String input, String dateTime, int? id});
}

/// @nodoc
class _$DateModelCopyWithImpl<$Res, $Val extends DateModel>
    implements $DateModelCopyWith<$Res> {
  _$DateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? input = null,
    Object? dateTime = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      input: null == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DateModelCopyWith<$Res> implements $DateModelCopyWith<$Res> {
  factory _$$_DateModelCopyWith(
          _$_DateModel value, $Res Function(_$_DateModel) then) =
      __$$_DateModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String input, String dateTime, int? id});
}

/// @nodoc
class __$$_DateModelCopyWithImpl<$Res>
    extends _$DateModelCopyWithImpl<$Res, _$_DateModel>
    implements _$$_DateModelCopyWith<$Res> {
  __$$_DateModelCopyWithImpl(
      _$_DateModel _value, $Res Function(_$_DateModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? input = null,
    Object? dateTime = null,
    Object? id = freezed,
  }) {
    return _then(_$_DateModel(
      input: null == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DateModel implements _DateModel {
  const _$_DateModel({required this.input, required this.dateTime, this.id});

  factory _$_DateModel.fromJson(Map<String, dynamic> json) =>
      _$$_DateModelFromJson(json);

  @override
  final String input;
  @override
  final String dateTime;
  @override
  final int? id;

  @override
  String toString() {
    return 'DateModel(input: $input, dateTime: $dateTime, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DateModel &&
            (identical(other.input, input) || other.input == input) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, input, dateTime, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DateModelCopyWith<_$_DateModel> get copyWith =>
      __$$_DateModelCopyWithImpl<_$_DateModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DateModelToJson(
      this,
    );
  }
}

abstract class _DateModel implements DateModel {
  const factory _DateModel(
      {required final String input,
      required final String dateTime,
      final int? id}) = _$_DateModel;

  factory _DateModel.fromJson(Map<String, dynamic> json) =
      _$_DateModel.fromJson;

  @override
  String get input;
  @override
  String get dateTime;
  @override
  int? get id;
  @override
  @JsonKey(ignore: true)
  _$$_DateModelCopyWith<_$_DateModel> get copyWith =>
      throw _privateConstructorUsedError;
}
