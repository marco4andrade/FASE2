import 'package:dartz/dartz.dart';
import 'package:step2/core/error/failures.dart';
import 'package:step2/domain/entities/product.dart';
import 'package:step2/domain/entities/category.dart';
import 'package:step2/domain/entities/user.dart';
import 'package:step2/domain/repositories/store_repository.dart';

/// **StoreUseCases** - Caso de uso centralizado para operaciones de la tienda
/// 
/// Centraliza todas las operaciones relacionadas con la tienda de manera limpia
/// y siguiendo el principio de responsabilidad única. Utiliza la nueva 
/// nomenclatura DomainError para mejor claridad semántica.
/// 
/// **Ventajas de la centralización:**
/// - ✅ **Simplicidad**: Una sola clase para todas las operaciones de tienda
/// - ✅ **Mantenibilidad**: Fácil agregar nuevas operaciones
/// - ✅ **Reutilización**: Evita duplicación de código entre casos de uso
/// - ✅ **Testabilidad**: Una sola dependencia de repositorio para testear
/// - ✅ **Clean Architecture**: Mantiene la separación de capas
/// 
/// **Reemplaza las clases eliminadas:**
/// - `GetProductsUseCase` ❌ -> `getProducts()` ✅
/// - `GetCategoriesUseCase` ❌ -> `getCategories()` ✅  
/// - `GetUsersUseCase` ❌ -> `getUsers()` ✅
/// - `BaseUseCase<Type, Params>` ❌ -> Métodos directos ✅
/// 
/// **Patron Repository + Use Case simplificado:**
/// ```dart
/// // Antes (redundante):
/// final useCase = GetProductsUseCase(repository);
/// final result = await useCase.call(NoParams());
/// 
/// // Ahora (directo):
/// final result = await storeUseCases.getProducts();
/// ```
class StoreUseCases {
  final StoreRepository _repository;

  /// **Constructor** - Inyecta la dependencia del repositorio
  /// 
  /// **Parámetros:**
  /// - [repository]: Implementación del repositorio de tienda
  /// 
  const StoreUseCases(this._repository);

  /// **Obtener productos** - Recupera la lista completa de productos
  /// 
  /// Utiliza el repositorio para obtener todos los productos disponibles.
  /// Maneja errores de manera consistente utilizando Either.
  /// 
  /// **Retorna:**
  /// - `Right(List<ProductModel>)`: Lista de productos en caso de éxito
  /// - `Left(DomainError)`: Error específico del dominio en caso de fallo
  /// 
  /// **Ejemplo de uso:**
  /// ```dart
  /// final result = await storeUseCases.getProducts();
  /// result.fold(
  ///   (error) => print('Error: ${error.message}'),
  ///   (products) => print('${products.length} productos cargados'),
  /// );
  /// ```
  Future<Either<DomainError, List<Product>>> getProducts() async {
    print('🚀 StoreUseCases: Iniciando obtención de productos...');
    return _repository.getProducts();
  }

  /// **Obtener categorías** - Recupera todas las categorías de productos
  /// 
  /// Utiliza el repositorio para obtener las categorías disponibles.
  /// Esencial para filtros y navegación por categorías.
  /// 
  /// **Retorna:**
  /// - `Right(List<Category>)`: Lista de categorías en caso de éxito
  /// - `Left(DomainError)`: Error específico del dominio en caso de fallo
  /// 
  /// **Ejemplo de uso:**
  /// ```dart
  /// final result = await storeUseCases.getCategories();
  /// result.fold(
  ///   (error) => print('Error: ${error.message}'),
  ///   (categories) => print('${categories.length} categorías disponibles'),
  /// );
  /// ```
  Future<Either<DomainError, List<Category>>> getCategories() {
    return _repository.getAllCategories();
  }

  /// **Obtener usuarios** - Recupera la lista de usuarios registrados
  /// 
  /// Utiliza el repositorio para obtener información de usuarios.
  /// Útil para administración y funcionalidades sociales.
  /// 
  /// **Retorna:**
  /// - `Right(List<User>)`: Lista de usuarios en caso de éxito
  /// - `Left(DomainError)`: Error específico del dominio en caso de fallo
  /// 
  /// **Ejemplo de uso:**
  /// ```dart
  /// final result = await storeUseCases.getUsers();
  /// result.fold(
  ///   (error) => print('Error: ${error.message}'),
  ///   (users) => print('${users.length} usuarios registrados'),
  /// );
  /// ```
  Future<Either<DomainError, List<User>>> getUsers() {
    return _repository.getUsers();
  }
}
