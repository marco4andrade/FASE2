import '../models/product_model.dart';

/// **ProductMapper** - Mapper especializado para datos de productos
///
/// Maneja la conversión entre datos JSON de API y objetos ProductModel,
/// separando las responsabilidades de mapeo de la lógica del modelo.
///
/// **Responsabilidades:**
/// - Mapear datos JSON a ProductModel
/// - Validar integridad de datos de producto
/// - Manejar conversiones de tipos de manera segura
/// - Proporcionar mensajes de error contextuales
class ProductMapper {
  static ProductModel fromJson(Map<String, dynamic> json) {
    try {
      return ProductModel(
        id: json['id'] as int,
        title: json['title'] as String,
        description: json['description'] as String,
        price: (json['price'] as num).toDouble(),
        category: json['category'] as String,
        image: json['image'] as String,
      );
    } catch (e) {
      throw FormatException(
        'Error al mapear producto desde JSON: $e\n'
        'Datos recibidos: $json',
      );
    }
  }

  static List<ProductModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
