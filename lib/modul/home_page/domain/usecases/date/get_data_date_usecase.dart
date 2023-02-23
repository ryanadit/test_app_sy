import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_synapsisid/common/usecases/usecase.dart';
import 'package:test_synapsisid/common/utils/failure.dart';
import 'package:test_synapsisid/modul/home_page/data/models/date_model.codegen.dart';
import 'package:test_synapsisid/modul/home_page/domain/repositories/date_repository.dart';

@lazySingleton
class GetDataDateUsecase extends UseCaseNoParams<List<DateModel>> {
  final DateRepository _dateRepository;

  GetDataDateUsecase(this._dateRepository);

  @override
  Future<Either<Failure, List<DateModel>>> call() async {
    return await _dateRepository.getDateData();
  }

}