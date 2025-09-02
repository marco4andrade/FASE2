import 'package:dartz/dartz.dart';
import 'package:step2/core/error/failure.dart';
import 'package:step2/domain/entities/category.dart';
import 'package:step2/domain/entities/product.dart';
import 'package:step2/domain/entities/user.dart';

abstract class StoreRepository {
  Future<Either<Failure, List<Product>>> getProducts();
  Future<Either<Failure, List<Category>>> getAllCategories();
  Future<Either<Failure, List<User>>> getUsers();
}