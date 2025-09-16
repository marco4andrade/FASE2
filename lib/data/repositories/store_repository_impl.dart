import 'package:dartz/dartz.dart';
import 'package:step2/data/datasources/store_api_service.dart';
import 'package:step2/data/models/product_model.dart';
import 'package:step2/data/models/category_model.dart';
import 'package:step2/data/models/user_model.dart';
import 'package:step2/domain/repositories/store_repository.dart';
import 'package:step2/domain/entities/product.dart';
import 'package:step2/domain/entities/category.dart';
import 'package:step2/domain/entities/user.dart';
import 'package:step2/core/error/failures.dart';

/// **StoreRepositoryImpl** - Implementación del repositorio de tienda
/// 
/// Implementa StoreRepository utilizando StoreApiService como fuente de datos.
/// Utiliza la nueva nomenclatura DomainError para mejor claridad semántica.
class StoreRepositoryImpl implements StoreRepository {
  final StoreApiService storeApiService;

  StoreRepositoryImpl(this.storeApiService);

  @override
  Future<Either<DomainError, List<Product>>> getProducts() async {
    try {
      final List<ProductModel> products = await storeApiService.fetchProducts();
      // Como ProductModel extiende Product, podemos devolver la lista directamente
      return Right(products);
    } catch (error) {
      return Left(ServerError('Error al obtener productos: $error'));
    }
  }

  @override
  Future<Either<DomainError, List<Category>>> getAllCategories() async {
    try {
      final List<CategoryModel> categories = await storeApiService.fetchCategories();
      // Como CategoryModel extiende Category, podemos devolver la lista directamente
      return Right(categories);
    } catch (error) {
      return Left(ServerError('Error al obtener categorías: $error'));
    }
  }

  @override
  Future<Either<DomainError, List<User>>> getUsers() async {
    try {
      final List<UserModel> users = await storeApiService.fetchUsers();
      // Como UserModel extiende User, podemos devolver la lista directamente
      return Right(users);
    } catch (error) {
      return Left(ServerError('Error al obtener usuarios: $error'));
    }
  }
}
