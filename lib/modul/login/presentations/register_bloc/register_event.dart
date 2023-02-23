part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {

  const factory RegisterEvent.visiblePasswordMethod() =
  _VisiblePasswordMethodEvent;

  const factory RegisterEvent.registerEvent(
      String email,
      String password,
  ) = _RegisterEvent;

}