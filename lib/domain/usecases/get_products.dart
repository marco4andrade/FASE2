import 'package:dartz/dartz.dart';
import 'package:step2/core/error/failure.dart';
import 'package:step2/core/usecases/usecase.dart';
import 'package:step2/domain/entities/product.dart';
import 'package:step2/domain/repositories/store_repository.dart';

class GetProducts implements UseCase<List<Product>, NoParams>{
  final StoreRepository repository;

  GetProducts(this.repository);

  @override
  Future<Either<Failure, List<Product>>> call(NoParams params) {
    return repository.getProducts();
  }
}