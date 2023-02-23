import 'package:dartz/dartz.dart';
import 'package:test_synapsisid/common/utils/failure.dart';
import 'package:test_synapsisid/modul/home_page/data/models/date_model.codegen.dart';

abstract class DateRepository {
  Future<Either<Failure, List<DateModel>>> getDateData();
  Future<Either<Failure, bool>> updateDateData(DateModel data);
  Future<Either<Failure, bool>> insertDateData(DateModel data);
  Future<Either<Failure, bool>> deleteDateData(DateModel data);
}
