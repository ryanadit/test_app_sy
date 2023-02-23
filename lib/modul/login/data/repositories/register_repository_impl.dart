import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:test_synapsisid/common/module/db/db_init.dart';
import 'package:test_synapsisid/common/utils/failure.dart';
import 'package:test_synapsisid/common/utils/name_helper.dart';
import 'package:test_synapsisid/modul/login/data/models/register_user_model.codegen.dart';
import 'package:test_synapsisid/modul/login/domain/repositories/register_repositories.dart';

@LazySingleton(as: RegisterRepository)
class RegisterRepositoryImpl implements RegisterRepository {

  @override
  Future<Either<Failure, bool>> register(RegisterUserModel data) async {
    try{
      Database database = await DbInit().database;
      final result = await database.query(NameHelper.userDb,
          where: 'username = ?',
          whereArgs: [data.username]
      );

      if (result.isEmpty) {
        final res = await database.insert(NameHelper.userDb, data.toJson());
        if (res > 0) {
          return const Right(true);
        } else {
          return Left(AppError(message: 'Gagal Register'));
        }
      } else {
        return Left(AppError(message: NameHelper.messageUsernameExist));
      }

    } catch (e) {
      return Left(AppError(message: '$e'));
    }
  }

}