import 'package:dartz/dartz.dart';
import 'package:step2/core/error/failures.dart';
import 'package:step2/domain/entities/product.dart';
import 'package:step2/domain/entities/category.dart';
import 'package:step2/domain/entities/user.dart';

/// **StoreRepository** - Repositorio abstracto para operaciones de tienda
/// 
/// Define el contrato para acceso a datos de productos, categorías y usuarios.
/// Utiliza Either DomainError siguiendo las mejores prácticas.
/// En Clean Architecture, los repositorios del dominio trabajan con entidades.
abstract class StoreRepository {
  /// **Obtener productos** - Recupera lista de productos disponibles
  Future<Either<DomainError, List<Product>>> getProducts();
  
  /// **Obtener categorías** - Recupera todas las categorías de productos
  Future<Either<DomainError, List<Category>>> getAllCategories();
  
  /// **Obtener usuarios** - Recupera lista de usuarios registrados
  Future<Either<DomainError, List<User>>> getUsers();
}