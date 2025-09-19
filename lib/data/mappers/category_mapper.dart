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
  static CategoryModel fromString(String rawCategoryName) {
    try {
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

  static List<CategoryModel> fromStringList(List<dynamic> stringList) {
    return stringList
        .map((categoryName) => fromString(categoryName as String))
        .toList();
  }
}
