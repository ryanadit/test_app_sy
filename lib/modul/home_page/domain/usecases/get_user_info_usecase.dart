import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_synapsisid/common/usecases/usecase.dart';
import 'package:test_synapsisid/common/utils/failure.dart';
import 'package:test_synapsisid/common/utils/name_helper.dart';
import 'package:test_synapsisid/modul/home_page/data/datasources/user_local_datasource.dart';
import 'package:test_synapsisid/modul/home_page/data/models/user_model.codegen.dart';

@lazySingleton
class GetUserInfoLogin extends UseCaseNoParams<UserModel?> {
  final UserLocalDatasource _userLocalDatasource;

  GetUserInfoLogin(this._userLocalDatasource);

  @override
  Future<Either<Failure, UserModel?>> call() async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      final resultUser = await _userLocalDatasource
          .getUser(sharedPreferences.getString(NameHelper.nameUsername) ?? ''
      );

      if (resultUser != null) {
        if (resultUser.isLogin == '1') {
          return Right(resultUser);
        } else {
          return Left(AppError(message: 'Belum login'));
        }
      } else {
        return Left(AppError(message: 'Belum ada data'));
      }

    } catch(e) {
      return Left(AppError(message: '$e'));
    }


  }
}