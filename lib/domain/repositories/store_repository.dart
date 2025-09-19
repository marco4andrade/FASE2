import 'package:dartz/dartz.dart';
import 'package:step2/core/error/failures.dart';
import 'package:step2/data/models/product_model.dart';
import 'package:step2/data/models/category_model.dart';
import 'package:step2/data/models/user_model.dart';

/// **StoreRepository** - Repositorio abstracto para operaciones de tienda
///
/// Define el contrato para acceso a datos de productos, categorías y usuarios.
/// Utiliza Either DomainError siguiendo las mejores prácticas.
/// Simplificado para trabajar directamente con models.
abstract class StoreRepository {
  /// **Obtener productos** - Recupera lista de productos disponibles
  Future<Either<DomainError, List<ProductModel>>> getProducts();

  /// **Obtener categorías** - Recupera todas las categorías de productos
  Future<Either<DomainError, List<CategoryModel>>> getAllCategories();

  /// **Obtener usuarios** - Recupera lista de usuarios registrados
  Future<Either<DomainError, List<UserModel>>> getUsers();
}
