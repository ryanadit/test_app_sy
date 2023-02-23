import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_synapsisid/common/usecases/usecase.dart';
import 'package:test_synapsisid/common/utils/failure.dart';
import 'package:test_synapsisid/modul/home_page/data/models/date_model.codegen.dart';
import 'package:test_synapsisid/modul/home_page/domain/repositories/date_repository.dart';

@lazySingleton
class UpdateDateUsecase extends UseCase<bool, DateModel> {
  final DateRepository _dateRepository;

  UpdateDateUsecase(this._dateRepository);

  @override
  Future<Either<Failure, bool>> call(DateModel params) async {
    return await _dateRepository.updateDateData(params);
  }

}