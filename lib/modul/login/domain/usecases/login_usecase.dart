import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_synapsisid/common/usecases/usecase.dart';
import 'package:test_synapsisid/common/utils/failure.dart';
import 'package:test_synapsisid/modul/login/domain/entities/login_entity.codegen.dart';
import 'package:test_synapsisid/modul/login/domain/repositories/login_repositories.dart';

@lazySingleton
class LoginUsecase extends UseCase<LoginEntity, LoginEntity> {
  final LoginRepository _loginRepository;

  LoginUsecase(this._loginRepository);

  @override
  Future<Either<Failure, LoginEntity>> call(params) async {
    return _loginRepository.login(params);
  }

}