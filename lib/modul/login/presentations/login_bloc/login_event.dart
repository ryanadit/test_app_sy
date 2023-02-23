part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {

  const factory LoginEvent.getUserInfoLogin() =
  _GetUserInfoLoginEvent;

  const factory LoginEvent.visiblePasswordMethod() =
  _VisiblePasswordMethodEvent;

  const factory LoginEvent.loginEvent(
      String email,
      String password,
  ) = _LoginEvent;

  const factory LoginEvent.logoutEvent(
      String email,
  ) = _LogoutEvent;

  const factory LoginEvent.loginNFCEvent() =
  _LoginNFCEvent;

  const factory LoginEvent.loginQREvent() =
  _LoginQREvent;

  const factory LoginEvent.loginBiometricsEvent() =
  _LoginBiometricsEvent;

}