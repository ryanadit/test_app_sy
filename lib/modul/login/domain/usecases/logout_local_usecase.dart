import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_synapsisid/common/usecases/usecase.dart';
import 'package:test_synapsisid/common/utils/failure.dart';
import 'package:test_synapsisid/modul/login/domain/repositories/login_repositories.dart';

@lazySingleton
class LogoutLocalUsecase extends UseCaseNoParams<bool> {
  final LoginRepository _loginRepository;

  LogoutLocalUsecase(this._loginRepository);

  @override
  Future<Either<Failure, bool>> call() async {
    return await _loginRepository.logoutLocal();
  }

}