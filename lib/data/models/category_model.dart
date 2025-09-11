import '../../domain/entities/category_entity.dart';

/// **CategoryModel** - Modelo de datos para categorías del Store API
/// 
/// Extiende [Category] para proporcionar funcionalidad especializada
/// de parsing y validación de categorías de productos.
/// 
/// **Responsabilidades:**
/// - Deserializar nombres de categoría desde String API
/// - Validar longitud y contenido de nombres de categoría
/// - Asegurar calidad de datos para navegación de productos
/// - Proporcionar feedback claro en caso de errores
/// 

class CategoryModel extends Category {
  /// **Constructor principal** - Crea instancia de CategoryModel
  /// 
  CategoryModel({required String name}) : super(name: name);

  /// **Factory constructor** - Crea CategoryModel desde String API
  /// 
  /// Especializado para APIs que retornan categorías como strings simples
  /// en lugar de objetos JSON complejos.
  /// 
  factory CategoryModel.fromJson(String rawCategoryName) {
    return CategoryModel(name: rawCategoryName);
  }


}