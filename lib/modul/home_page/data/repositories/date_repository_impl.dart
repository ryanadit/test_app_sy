import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_synapsisid/common/module/db/db_init.dart';
import 'package:test_synapsisid/common/utils/failure.dart';
import 'package:test_synapsisid/common/utils/name_helper.dart';
import 'package:test_synapsisid/modul/home_page/data/models/date_model.codegen.dart';
import 'package:test_synapsisid/modul/home_page/domain/repositories/date_repository.dart';

@LazySingleton(as: DateRepository)
class DateRepositoryImpl implements DateRepository{

  @override
  Future<Either<Failure, bool>> deleteDateData(DateModel data) async {
    try {
      Database database = await DbInit().database;
      final result = await database.delete(
          NameHelper.dateDb,
          whereArgs: [data.id],
          where: 'id = ?'
      );
      if (result > 0) {
        return const Right(true);
      } else {
        return const Right(false);
      }
    } catch(e) {
      return Left(AppError(message: '$e'));
    }
  }

  @override
  Future<Either<Failure, List<DateModel>>> getDateData() async {
    try {
      List<DateModel> datas = [];
      Database database = await DbInit().database;
      final result = await database.query(NameHelper.dateDb);
      if (result.isNotEmpty) {
        for (var res in result) {
          datas.add(DateModel.fromJson(res));
        }
        return Right(datas);
      } else {
        return Right(datas);
      }
    } catch (e) {
      return Left(AppError(message: '$e'));
    }
  }

  @override
  Future<Either<Failure, bool>> insertDateData(DateModel data) async {
    try {
      Database database = await DbInit().database;
      final result = await database.insert(NameHelper.dateDb, data.toJson());
      if (result > 0) {
        return const Right(true);
      } else {
        return const Right(false);
      }
    } catch (e) {
      return Left(AppError(message: '$e'));
    }
  }

  @override
  Future<Either<Failure, bool>> updateDateData(DateModel data) async {
    try {
      Database database = await DbInit().database;
      final result = await database.update(
          NameHelper.dateDb,
          data.toJson(),
        whereArgs: [data.id],
        where: 'id = ?'
      );
      if (result > 0) {
        return const Right(true);
      } else {
        return const Right(false);
      }
    } catch(e) {
      return Left(AppError(message: '$e'));
    }
  }

}