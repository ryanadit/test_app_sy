import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:test_synapsisid/common/extension/dartz_extension.dart';
import 'package:test_synapsisid/common/module/db/db_init.dart';
import 'package:test_synapsisid/common/utils/failure.dart';
import 'package:test_synapsisid/common/utils/name_helper.dart';
import 'package:test_synapsisid/modul/login/domain/entities/login_entity.codegen.dart';
import 'package:test_synapsisid/modul/login/domain/repositories/login_repositories.dart';

@LazySingleton(as: LoginRepository)
class LoginRepositoryImp implements LoginRepository {

  @override
  Future<Either<Failure, LoginEntity>> login(LoginEntity data) async {
    try {
      Database database = await DbInit().database;
      LoginEntity? dataLogin;
      final result = await database.query(NameHelper.userDb,
          where: 'username = ? AND password = ?',
          whereArgs: [data.username, data.password]
      );
      if (result.isNotEmpty) {
        dataLogin = LoginEntity.fromJson(result.first);
        LoginEntity loginEntity = LoginEntity(
          username: dataLogin.username,
          password: dataLogin.password,
          isLogin: '1'
        );
        final resLogin = await _updateLogin(loginEntity);
        if (resLogin.isRight()) {
          SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
          sharedPreferences.setString(NameHelper.nameUsername, data.username);
          return Right(resLogin.getRight()!);
        } else {
          return Left(resLogin.getLeft()!);
        }
      } else {
        return Left(AppError(message: 'Username atau password tidak cocok'));
      }
    } catch(exception) {
      return Left(DatabaseFailure(message: '$exception'));
    }
  }

  @override
  Future<Either<Failure, bool>> logout(String username) async {
    try {
      Database database = await DbInit().database;
      final result = await database.query(NameHelper.userDb,
          where: 'username = ?',
          whereArgs: [username]
      );
      if (result.length == 1) {
        LoginEntity dataLogin = LoginEntity.fromJson(result.first);
        LoginEntity loginEntity = LoginEntity(
            username: dataLogin.username,
            password: dataLogin.password,
            isLogin: '0'
        );
        final resLogin = await _updateLogin(loginEntity);
        if (resLogin.isRight()) {
          SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
          await sharedPreferences.clear();
          return const Right(true);
        } else {
          return Left(resLogin.getLeft()!);
        }
      } else {
        return Left(AppError(message: 'Something error'));
      }
    } catch (e) {
      return Left(AppError(message: '$e'));
    }
  }
  
  Future<Either<Failure, LoginEntity?>> _updateLogin(LoginEntity data) async {
    try {
      LoginEntity? dataLogin;
      Database database = await DbInit().database;
      final result = await database.update(NameHelper.userDb, data.toJson(),
          where: 'username = ?',
          whereArgs: [data.username]
      );
      if (result > 0) {
        List dataLoginList = await database.query(NameHelper.userDb,
            where: 'username = ?',
            whereArgs: [data.username]
        );
        if (dataLoginList.isNotEmpty && dataLoginList.length == 1) {
          dataLogin = LoginEntity.fromJson(dataLoginList.first);
          return Right(dataLogin);
        } else {
          return Left(AppError(message: 'Username telah digunakan, Gagal simpan'));
        }
      } else {
        return Left(AppError(message: 'Failed'));
      }
    } catch (e) {
      return Left(DatabaseFailure(message: '$e'));
    }

  }

  @override
  Future<Either<Failure, bool>> logoutLocal() async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      final result = await sharedPreferences.clear();
      if (result) {
        return Right(result);
      } else {
        return Left(AppError(message: 'Gagal Logout'));
      }
    } catch (e) {
      return Left(AppError(message: '$e'));
    }
  }

}