import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  String get failureMessage;
}

class DatabaseFailure extends Failure {
  final String message;
  DatabaseFailure({required this.message});

  @override
  String get failureMessage => message;

  @override
  List<Object?> get props => [message];
}

class AppError extends Failure {
  final String message;
  AppError({required this.message});

  @override
  String get failureMessage => message;

  @override
  List<Object?> get props => [message];
}