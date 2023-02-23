part of 'register_bloc.dart';

enum RegisterStatus {
  initial,
  loading,
  successRegister,
  failedRegister
}

@freezed
class RegisterState with _$RegisterState {
  factory RegisterState({
    required bool? statusRegister,
    required bool? usernameExistBool,
    required RegisterStatus registerStatus,
    String? message,
    bool? visiblePasswordBool,
  }) = _RegisterState;

  factory RegisterState.initial() => RegisterState(
    statusRegister: false,
    usernameExistBool: false,
    registerStatus: RegisterStatus.initial,
    message: '',
    visiblePasswordBool: false
  );

}