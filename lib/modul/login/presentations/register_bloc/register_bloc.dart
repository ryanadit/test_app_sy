import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_synapsisid/common/extension/dartz_extension.dart';
import 'package:test_synapsisid/common/utils/name_helper.dart';
import 'package:test_synapsisid/modul/login/data/models/register_user_model.codegen.dart';
import 'package:test_synapsisid/modul/login/domain/usecases/register_usecase.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUsecase _registerUsecase;

  RegisterBloc(
      this._registerUsecase
  ) : super(RegisterState.initial()) {
    on<_RegisterEvent>(_registerEvent);
    on<_VisiblePasswordMethodEvent>(_visiblePasswordMethodEvent);
  }

  FutureOr<void> _visiblePasswordMethodEvent(
      _,
      emit,
      ) async {
    emit(
        state.copyWith(
          visiblePasswordBool: !state.visiblePasswordBool!,
        )
    );
  }

  FutureOr<void> _registerEvent(
      _RegisterEvent event,
      emit,
  ) async {
    emit(
        state.copyWith(
          registerStatus: RegisterStatus.loading
        )
    );
    RegisterUserModel dataRegister = RegisterUserModel(
      username: event.email,
      password: event.password,
      isLogin: '0'
    );
    final result = await _registerUsecase.call(dataRegister);

    if (result.isRight()) {
      emit(
        state.copyWith(
          statusRegister: true,
          message: 'Register success',
          registerStatus: RegisterStatus.successRegister
        )
      );
    } else {
      if (result.getLeft()!.failureMessage == NameHelper.messageUsernameExist) {
        emit(
            state.copyWith(
              statusRegister: false,
              usernameExistBool: true,
              message: result.getLeft()!.failureMessage,
              registerStatus: RegisterStatus.failedRegister
            )
        );
      } else {
        emit(
            state.copyWith(
                statusRegister: false,
                message: result.getLeft()!.failureMessage,
              registerStatus: RegisterStatus.failedRegister
            )
        );
      }
    }

  }

}