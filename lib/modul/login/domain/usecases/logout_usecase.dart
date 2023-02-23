import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_synapsisid/common/usecases/usecase.dart';
import 'package:test_synapsisid/common/utils/failure.dart';
import 'package:test_synapsisid/modul/login/domain/repositories/login_repositories.dart';

@lazySingleton
class LogoutUsecase extends UseCase<bool, String> {
  final LoginRepository _loginRepository;

  LogoutUsecase(this._loginRepository);

  @override
  Future<Either<Failure, bool>> call(params) async {
    return _loginRepository.logout(params);
  }

}