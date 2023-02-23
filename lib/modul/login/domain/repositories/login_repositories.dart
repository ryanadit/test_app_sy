import 'package:dartz/dartz.dart';
import 'package:test_synapsisid/common/utils/failure.dart';
import 'package:test_synapsisid/modul/login/domain/entities/login_entity.codegen.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginEntity>> login(LoginEntity data);
  Future<Either<Failure, bool>> logout(String username);
  Future<Either<Failure, bool>> logoutLocal();
}