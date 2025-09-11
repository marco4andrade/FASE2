import 'package:dartz/dartz.dart';
import 'package:step2/core/error/failures.dart';
import 'package:step2/core/usecases/base_usecase.dart';
import 'package:step2/domain/entities/product_entity.dart';
import 'package:step2/domain/entities/category_entity.dart';
import 'package:step2/domain/entities/user_entity.dart';
import 'package:step2/domain/repositories/store_repository.dart';

/// Caso de uso centralizado para todas las operaciones de la tienda
class StoreUseCases {
  final StoreRepository repository;

  StoreUseCases(this.repository);

  /// Obtiene todos los productos de la tienda
  Future<Either<Failure, List<Product>>> getProducts() {
    return repository.getProducts();
  }

  /// Obtiene todas las categorías de la tienda
  Future<Either<Failure, List<Category>>> getCategories() {
    return repository.getAllCategories();
  }

  /// Obtiene todos los usuarios de la tienda
  Future<Either<Failure, List<User>>> getUsers() {
    return repository.getUsers();
  }
}

/// Casos de uso individuales mantenidos para compatibilidad con la arquitectura actual
class GetProducts implements UseCase<List<Product>, NoParams> {
  final StoreUseCases _storeUseCases;

  GetProducts(StoreRepository repository) : _storeUseCases = StoreUseCases(repository);

  @override
  Future<Either<Failure, List<Product>>> call(NoParams params) {
    return _storeUseCases.getProducts();
  }
}

class GetCategories implements UseCase<List<Category>, NoParams> {
  final StoreUseCases _storeUseCases;

  GetCategories(StoreRepository repository) : _storeUseCases = StoreUseCases(repository);

  @override
  Future<Either<Failure, List<Category>>> call(NoParams params) {
    return _storeUseCases.getCategories();
  }
}

class GetUsers implements UseCase<List<User>, NoParams> {
  final StoreUseCases _storeUseCases;

  GetUsers(StoreRepository repository) : _storeUseCases = StoreUseCases(repository);

  @override
  Future<Either<Failure, List<User>>> call(NoParams params) {
    return _storeUseCases.getUsers();
  }
}
