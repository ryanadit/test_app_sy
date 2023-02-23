import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_synapsisid/common/extension/dartz_extension.dart';
import 'package:test_synapsisid/common/utils/name_helper.dart';
import 'package:test_synapsisid/modul/home_page/domain/usecases/get_user_info_usecase.dart';
import 'package:test_synapsisid/modul/home_page/domain/usecases/login_user_biometrics_usecase.dart';
import 'package:test_synapsisid/modul/home_page/domain/usecases/login_user_nfc_usecase.dart';
import 'package:test_synapsisid/modul/home_page/domain/usecases/login_user_qr_usecase.dart';
import 'package:test_synapsisid/modul/login/domain/entities/login_entity.codegen.dart';
import 'package:test_synapsisid/modul/login/domain/usecases/login_usecase.dart';
import 'package:test_synapsisid/modul/login/domain/usecases/logout_local_usecase.dart';
import 'package:test_synapsisid/modul/login/domain/usecases/logout_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase _loginUsecase;
  final LogoutUsecase _logoutUsecase;
  final LoginUserNFCUsecase _loginUserNFCUsecase;
  final LoginUserBiometricsUsecase _loginUserBiometricsUsecase;
  final LoginUserQRUsecase _loginUserQRUsecase;
  final GetUserInfoLogin _getUserInfoLogin;
  final LogoutLocalUsecase _logoutLocalUsecase;

  LoginBloc(
      this._loginUsecase,
      this._logoutUsecase,
      this._loginUserNFCUsecase,
      this._loginUserBiometricsUsecase,
      this._loginUserQRUsecase,
      this._getUserInfoLogin,
      this._logoutLocalUsecase
  ) : super(LoginState.initial()) {
    on<_LoginEvent>(_loginEvent);
    on<_LogoutEvent>(_logoutEvent);
    on<_VisiblePasswordMethodEvent>(_visiblePasswordMethodEvent);
    on<_LoginNFCEvent>(_loginNFCEvent);
    on<_LoginQREvent>(_loginQREvent);
    on<_LoginBiometricsEvent>(_loginBiometricsEvent);
    on<_GetUserInfoLoginEvent>(_getUserInfoLoginEvent);
  }

  FutureOr<void> _getUserInfoLoginEvent(
      _,
      emit,
      ) async {
    emit(state.copyWith(loginStatus: LoginStatus.initial));
    final result = await _getUserInfoLogin.call();

    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool loginWithQR = preferences.getBool(NameHelper.nameQR) ?? false;
    bool loginWithNFC = preferences.getBool(NameHelper.nameNFC) ?? false;
    bool loginWithBio = preferences.getBool(NameHelper.nameBiometrics) ?? false;
    if ( result.isRight() ||
        (loginWithQR || loginWithNFC || loginWithBio)
    ) {
      emit(
          state.copyWith(
            statusLogin: true,
            loginStatus: LoginStatus.statusLoaded,
            loginNFCBool: loginWithNFC,
            loginBiometricsBool: loginWithBio,
            loginQRBool: loginWithQR
          )
      );
    } else {
      emit(
          state.copyWith(
              statusLogin: false,
              loginStatus: LoginStatus.statusLoaded
          )
      );
    }


  }

  FutureOr<void> _visiblePasswordMethodEvent(
      _,
      emit,
  ) async {
    emit(
      state.copyWith(
        visiblePasswordBool: !state.visiblePasswordBool,
        loginStatus: LoginStatus.changeVisiblePasswordLogin
      )
    );
  }

  FutureOr<void> _loginEvent(
      _LoginEvent event,
      emit,
  ) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    LoginEntity loginEntity = LoginEntity(
      password: event.password,
      username: event.email
    );

    final resultLogin = await _loginUsecase.call(loginEntity);

    if (resultLogin.isRight()) {
      emit(
        state.copyWith(
          statusLogin: true,
          loginStatus: LoginStatus.successLogin
        )
      );
    } else {
      emit(
        state.copyWith(
          statusLogin: false,
          statusSubmitLogin: false,
          message: resultLogin.getLeft()!.failureMessage,
          loginStatus: LoginStatus.failedLogin
        )
      );
    }


  }

  FutureOr<void> _logoutEvent(
      _LogoutEvent event,
      emit,
  ) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List loginWithOther = [
      preferences.getBool(NameHelper.nameQR),
      preferences.getBool(NameHelper.nameNFC),
      preferences.getBool(NameHelper.nameBiometrics),
    ];
    final loginWithOtherBool = loginWithOther
        .any((element) => element == true
    );
    if (loginWithOtherBool) {
      final resultLogoutLocal = await _logoutLocalUsecase.call();
      if (resultLogoutLocal.isRight()) {
        emit(
            state.copyWith(
                statusLogin: false,
                loginStatus: LoginStatus.successLogout
            )
        );
      } else {
        emit(
            state.copyWith(
                message: resultLogoutLocal.getLeft()!.failureMessage,
                loginStatus: LoginStatus.failedLogout
            )
        );
      }
    } else {
      final resultLogout = await _logoutUsecase.call(event.email);
      if (resultLogout.isRight()) {
        emit(
            state.copyWith(
                statusLogin: false,
                loginStatus: LoginStatus.successLogout
            )
        );
      } else {
        emit(
            state.copyWith(
                message: resultLogout.getLeft()!.failureMessage,
                loginStatus: LoginStatus.failedLogout
            )
        );
      }
    }

  }

  FutureOr<void> _loginNFCEvent(_,emit) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    final res = await _loginUserNFCUsecase.call();
    if (res.isRight()) {
      emit(
        state.copyWith(
          loginNFCBool: true,
          message: 'Login Success',
          loginStatus: LoginStatus.successLogin
        )
      );
    } else {
      emit(
          state.copyWith(
              message: res.getLeft()!.failureMessage,
              loginStatus: LoginStatus.failedLogin
          )
      );
    }

  }

  FutureOr<void> _loginQREvent(_,emit) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    final res = await _loginUserQRUsecase.call();
    if (res.isRight()) {
      emit(
        state.copyWith(
          loginQRBool: true,
          message: 'Login Success',
          loginStatus: LoginStatus.successLogin
        )
      );
    } else {
      emit(
          state.copyWith(
              message: res.getLeft()!.failureMessage,
              loginStatus: LoginStatus.failedLogin
          )
      );
    }

  }

  FutureOr<void> _loginBiometricsEvent(_,emit) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    final res = await _loginUserBiometricsUsecase.call();
    if (res.isRight()) {
      emit(
        state.copyWith(
          loginBiometricsBool: true,
          message: 'Login Success',
          loginStatus: LoginStatus.successLogin
        )
      );
    } else {
      emit(
          state.copyWith(
              message: res.getLeft()!.failureMessage,
              loginStatus: LoginStatus.failedLogin
          )
      );
    }

  }

}
