import '../models/category_model.dart';

/// **CategoryMapper** - Mapper especializado para datos de categorías
/// 
/// Maneja la conversión entre datos de API y objetos CategoryModel,
/// proporcionando una separación clara entre lógica de mapeo y modelo.
/// 
/// **Responsabilidades:**
/// - Mapear datos string/JSON a CategoryModel
/// - Validar nombres de categoría
/// - Normalizar formato de categorías
/// - Manejar casos especiales de categorías
/// 
class CategoryMapper {
  /// **Mapeo desde String** - Convierte string a CategoryModel
  /// 
  /// Especializado para APIs que retornan categorías como strings simples,
  /// aplicando validación y normalización de nombres.
  /// 
  /// **Parámetros:**
  /// - [rawCategoryName]: Nombre de categoría desde API
  /// 
  /// **Retorna:** CategoryModel validado
  /// 
  /// **Lanza:** FormatException si el nombre no es válido
  /// 
  static CategoryModel fromString(String rawCategoryName) {
    try {
      // Validar que el nombre no esté vacío
      if (rawCategoryName.trim().isEmpty) {
        throw FormatException('El nombre de la categoría no puede estar vacío');
      }

      return CategoryModel(name: rawCategoryName.trim());
    } catch (e) {
      throw FormatException(
        'Error al mapear categoría desde string: $e\n'
        'Dato recibido: "$rawCategoryName"',
      );
    }
  }

  /// **Mapeo desde JSON** - Convierte Map JSON a CategoryModel
  /// 
  /// Para APIs que retornan categorías como objetos JSON complejos
  /// con múltiples propiedades.
  /// 
  /// **Parámetros:**
  /// - [json]: Mapa de datos JSON desde API
  /// 
  /// **Retorna:** CategoryModel validado
  /// 
  static CategoryModel fromJson(Map<String, dynamic> json) {
    try {
      return CategoryModel(
        name: json['name'] as String,
      );
    } catch (e) {
      throw FormatException(
        'Error al mapear categoría desde JSON: $e\n'
        'Datos recibidos: $json',
      );
    }
  }

  /// **Mapeo desde lista de strings** - Convierte lista de strings a lista de CategoryModel
  /// 
  /// Procesa múltiples categorías desde respuesta de API que retorna
  /// un array de strings de categorías.
  /// 
  /// **Parámetros:**
  /// - [stringList]: Lista de nombres de categoría desde API
  /// 
  /// **Retorna:** Lista de CategoryModel validados
  /// 
  static List<CategoryModel> fromStringList(List<dynamic> stringList) {
    return stringList
        .map((categoryName) => fromString(categoryName as String))
        .toList();
  }

  /// **Mapeo desde lista JSON** - Convierte lista de JSON a lista de CategoryModel
  /// 
  /// Para APIs que retornan categorías como array de objetos JSON.
  /// 
  /// **Parámetros:**
  /// - [jsonList]: Lista de mapas JSON desde API
  /// 
  /// **Retorna:** Lista de CategoryModel validados
  /// 
  static List<CategoryModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => fromJson(json as Map<String, dynamic>))
        .toList();
  }

  /// **Mapeo a JSON** - Convierte CategoryModel a Map JSON
  /// 
  /// **Parámetros:**
  /// - [category]: Instancia de CategoryModel a serializar
  /// 
  /// **Retorna:** Map JSON listo para envío a API
  /// 
  static Map<String, dynamic> toJson(CategoryModel category) {
    return {
      'name': category.name,
    };
  }
}
