import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_synapsisid/common/module/db/db_init.dart';
import 'package:test_synapsisid/common/utils/name_helper.dart';
import 'package:test_synapsisid/modul/home_page/data/models/user_model.codegen.dart';

abstract class UserLocalDatasource {
  Future<UserModel?> getUser(String username);
  Future<bool> getNFC();
  Future<bool> getQR();
  Future<bool> getBiometrics();
  Future<bool> saveNFC();
  Future<bool> saveQR();
  Future<bool> saveBiometrics();
}

@LazySingleton(as: UserLocalDatasource)
class UserLocalDatasourceImpl implements UserLocalDatasource {

  @override
  Future<UserModel?> getUser(String username) async {
    UserModel? userModel;
    try {
      Database database = await DbInit().database;
      final result = await database.query(NameHelper.userDb,
          where: 'username = ?',
          whereArgs: [username]
      );

      if (result.isNotEmpty && result.length == 1) {
        return UserModel.fromJson(result.first);
      } else {
        return userModel;
      }

    } catch (e) {
      return userModel;
    }

  }

  @override
  Future<bool> getBiometrics() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(NameHelper.nameBiometrics) ?? false;
  }

  @override
  Future<bool> getNFC() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(NameHelper.nameNFC) ?? false;
  }

  @override
  Future<bool> getQR() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(NameHelper.nameQR) ?? false;
  }

  @override
  Future<bool> saveBiometrics() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setBool(NameHelper.nameBiometrics, true);
  }

  @override
  Future<bool> saveNFC() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setBool(NameHelper.nameNFC, true);
  }

  @override
  Future<bool> saveQR() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setBool(NameHelper.nameQR, true);
  }
}