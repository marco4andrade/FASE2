import 'package:meta/meta.dart';
import '../../domain/entities/category.dart';

/// CategoryModel - Modelo de datos para categorías del Store API
///
/// * [name] (requerido): Nombre de la categoría que llega desde la API externa.
///   Representa la etiqueta o nombre identificativo de una categoría de productos
///   en el catálogo del store (ej: "electronics", "jewelry", "men's clothing").
@immutable
class CategoryModel extends Category {
  /// **Constructor** - Crea una instancia inmutable de CategoryModel
  /// 
  /// **Parámetros:**
  /// - [name]: Nombre de la categoría (requerido, no puede estar vacío)
  /// 
  const CategoryModel({required super.name});

  /// **Representación string** - Para debugging y logging específico del modelo
  /// 
  /// Proporciona una representación específica del modelo con prefijo CategoryModel.
  /// 
  @override
  String toString() {
    return 'CategoryModel(name: $name)';
  }

  /// **Copia con modificaciones** - Crea una nueva instancia con cambios
  /// 
  /// Útil para actualizaciones inmutables de la categoría.
  /// 
  /// **Parámetros:**
  /// - [name]: Nuevo nombre (opcional, mantiene el actual si es null)
  /// 
  CategoryModel copyWith({String? name}) {
    return CategoryModel(
      name: name ?? this.name,
    );
  }
}
