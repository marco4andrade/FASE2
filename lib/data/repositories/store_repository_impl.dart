import 'package:dartz/dartz.dart';
import 'package:step2/data/datasources/remote_datasource.dart';

import '../../domain/entities/product_entity.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/store_repository.dart';
import '../../core/error/failures.dart';

class StoreRepositoryImpl implements StoreRepository {
  final RemoteDataSource remoteDataSource;

  StoreRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final products = await remoteDataSource.fetchProducts();
      return Right(products);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getAllCategories() async {
    try {
      final categories = await remoteDataSource.fetchCategories();
      return Right(categories);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<User>>> getUsers() async {
    try {
      final users = await remoteDataSource.fetchUsers();
      return Right(users);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}