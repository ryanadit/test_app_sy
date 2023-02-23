import 'package:dartz/dartz.dart';
import 'package:test_synapsisid/common/utils/failure.dart';
import 'package:test_synapsisid/modul/login/data/models/register_user_model.codegen.dart';

abstract class RegisterRepository {
  Future<Either<Failure, bool>> register(RegisterUserModel data);
}