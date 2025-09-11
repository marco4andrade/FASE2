import 'package:dartz/dartz.dart';
import 'package:step2/core/error/failures.dart';
import 'package:step2/domain/entities/category_entity.dart';
import 'package:step2/domain/entities/product_entity.dart';
import 'package:step2/domain/entities/user_entity.dart';

abstract class StoreRepository {
  Future<Either<Failure, List<Product>>> getProducts();
  Future<Either<Failure, List<Category>>> getAllCategories();
  Future<Either<Failure, List<User>>> getUsers();
}