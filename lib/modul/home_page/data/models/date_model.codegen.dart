import 'package:freezed_annotation/freezed_annotation.dart';

part 'date_model.codegen.freezed.dart';
part 'date_model.codegen.g.dart';

@freezed
class DateModel with _$DateModel {
  const factory DateModel({
    required String input,
    required String dateTime,
    int? id
  }) = _DateModel;

  factory DateModel.fromJson(Map<String, dynamic> json) =>
      _$DateModelFromJson(json);

}