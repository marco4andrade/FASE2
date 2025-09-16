/// **Mappers Module** - Punto de acceso centralizado para todos los mappers
/// 
/// Este archivo actúa como un barril (barrel) que reexporta todos los mappers
/// del módulo de datos, facilitando las importaciones y manteniendo la organización.
/// 
/// **Propósito:**
/// - Simplificar importaciones de mappers en otras capas
/// - Mantener una interfaz limpia para el módulo de mappers
/// - Facilitar el mantenimiento y refactoring futuro
/// 
library;

export 'product_mapper.dart';
export 'category_mapper.dart';
export 'user_mapper.dart';
