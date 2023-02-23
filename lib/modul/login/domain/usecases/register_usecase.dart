import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_synapsisid/common/usecases/usecase.dart';
import 'package:test_synapsisid/common/utils/failure.dart';
import 'package:test_synapsisid/modul/login/data/models/register_user_model.codegen.dart';
import 'package:test_synapsisid/modul/login/domain/repositories/register_repositories.dart';

@lazySingleton
class RegisterUsecase extends UseCase<bool, RegisterUserModel> {
  final RegisterRepository _registerRepository;
  RegisterUsecase(this._registerRepository);

  @override
  Future<Either<Failure, bool>> call(params) async {
    return _registerRepository.register(params);
  }

}