import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_synapsisid/common/usecases/usecase.dart';
import 'package:test_synapsisid/common/utils/failure.dart';
import 'package:test_synapsisid/modul/home_page/data/datasources/user_local_datasource.dart';

@lazySingleton
class LoginUserQRUsecase extends UseCaseNoParams<bool> {
  final UserLocalDatasource _userLocalDatasource;

  LoginUserQRUsecase(this._userLocalDatasource);

  @override
  Future<Either<Failure, bool>> call() async {
    try {
      final res = await _userLocalDatasource.saveQR();
      if (res) {
        return Right(res);
      } else {
        return Left(AppError(message: 'QR Failed'));
      }
    } catch (e) {
      return Left(AppError(message: '$e'));
    }
  }


}