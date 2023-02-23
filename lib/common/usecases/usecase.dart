import 'package:dartz/dartz.dart';
import 'package:test_synapsisid/common/utils/failure.dart';

abstract class UseCase<ReturnType, Params> {
  const UseCase();
  Future<Either<Failure, ReturnType>> call(Params params);
}

abstract class UseCaseNoParams<ReturnType> {
  const UseCaseNoParams();
  Future<Either<Failure, ReturnType>> call();
}