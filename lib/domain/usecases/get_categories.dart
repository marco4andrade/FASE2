import 'package:dartz/dartz.dart';
import 'package:step2/core/error/failure.dart';
import 'package:step2/core/usecases/usecase.dart';
import 'package:step2/domain/entities/category.dart';
import 'package:step2/domain/repositories/store_repository.dart';

class GetCategories implements UseCase<List<Category>, NoParams>{
  final StoreRepository repository;
  GetCategories(this.repository);

  @override
  Future<Either<Failure, List<Category>>> call(NoParams params) {
    return repository.getAllCategories();
  }
}