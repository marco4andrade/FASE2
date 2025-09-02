import 'package:dartz/dartz.dart';
import 'package:step2/core/error/failure.dart';
import 'package:step2/core/usecases/usecase.dart';
import 'package:step2/domain/entities/user.dart';
import 'package:step2/domain/repositories/store_repository.dart';

class GetUsers implements UseCase<List<User>, NoParams>{
  final StoreRepository repository;
  GetUsers(this.repository);

  Future<Either<Failure, List<User>>> call(NoParams params) {
    return repository.getUsers();
  }
}