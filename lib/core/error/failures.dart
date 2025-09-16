/// **DomainError** - Clase base abstracta para todos los errores del dominio
/// 
/// Siguiendo las mejores prácticas, usa "Error" en lugar de "Failure" 
/// para mayor claridad semántica en los tipos Either.
abstract class DomainError {
  final String message;
  const DomainError(this.message);
  
  @override
  String toString() => 'DomainError: $message';
}

/// **ServerError** - Error relacionado con el servidor/API
/// 
/// Se produce cuando hay problemas de comunicación con el servidor,
/// respuestas HTTP con códigos de error, o problemas de backend.
class ServerError extends DomainError {
  const ServerError(super.message);
  
  @override
  String toString() => 'ServerError: $message';
}

/// **NetworkError** - Error relacionado con conectividad de red
/// 
/// Se produce cuando hay problemas de conexión a internet,
/// DNS, timeout de red, o falta de conectividad.
class NetworkError extends DomainError {
  const NetworkError(super.message);
  
  @override
  String toString() => 'NetworkError: $message';
}

/// **ValidationError** - Error de validación de datos
/// 
/// Se produce cuando los datos no cumplen con las reglas de negocio.
class ValidationError extends DomainError {
  const ValidationError(super.message);
  
  @override
  String toString() => 'ValidationError: $message';
}

/// **CacheError** - Error relacionado con almacenamiento local
/// 
/// Se produce cuando hay problemas con el almacenamiento local o caché.
class CacheError extends DomainError {
  const CacheError(super.message);
  
  @override
  String toString() => 'CacheError: $message';
}

/// **UnknownError** - Error genérico para casos no clasificados
/// 
/// Se usa como fallback cuando el tipo de error no puede ser clasificado.
class UnknownError extends DomainError {
  const UnknownError(super.message);
  
  @override
  String toString() => 'UnknownError: $message';
}

// DEPRECATED: Mantener para compatibilidad hacia atrás
// TODO: Remover en versiones futuras
@Deprecated('Usar DomainError en su lugar')
typedef Failure = DomainError;

@Deprecated('Usar ServerError en su lugar')
typedef ServerFailure = ServerError;

@Deprecated('Usar NetworkError en su lugar')
typedef NetworkFailure = NetworkError;