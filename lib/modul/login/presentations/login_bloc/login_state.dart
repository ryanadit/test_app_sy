part of 'login_bloc.dart';

enum LoginStatus{
  initial,
  loading,
  changeVisiblePasswordLogin,
  failedLogin,
  successLogin,
  statusLoaded,
  successLogout,
  failedLogout
}

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    required bool statusLogin,
    required bool visiblePasswordBool,
    required String message,
    required LoginStatus loginStatus,
    bool? loginNFCBool,
    bool? loginQRBool,
    bool? loginBiometricsBool,
    bool? loginUserBool,
    bool? statusSubmitLogin,
  }) = _LoginState;

  factory LoginState.initial() => LoginState(
    statusLogin: false,
    loginStatus: LoginStatus.initial,
    visiblePasswordBool: true,
    message: '',
    loginBiometricsBool: false,
    loginNFCBool: false,
    loginQRBool: false,
    loginUserBool: false,
    statusSubmitLogin: true
  );
}