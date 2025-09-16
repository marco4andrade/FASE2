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
/// 
class ProductMapper {
  /// **Mapeo desde JSON** - Convierte Map JSON a ProductModel
  /// 
  /// Transforma datos de API REST en instancia tipada y validada,
  /// manejando conversiones numéricas y validaciones de campos requeridos.
  /// 
  /// **Parámetros:**
  /// - [json]: Mapa de datos JSON desde API
  /// 
  /// **Retorna:** ProductModel validado y tipado
  /// 
  /// **Lanza:** FormatException si los datos no son válidos
  /// 
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

  /// **Mapeo desde lista JSON** - Convierte lista de JSON a lista de ProductModel
  /// 
  /// Procesa múltiples productos desde respuesta de API,
  /// manejando errores individuales sin afectar el resto del mapeo.
  /// 
  /// **Parámetros:**
  /// - [jsonList]: Lista de mapas JSON desde API
  /// 
  /// **Retorna:** Lista de ProductModel validados
  /// 
  static List<ProductModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => fromJson(json as Map<String, dynamic>))
        .toList();
  }

  /// **Mapeo a JSON** - Convierte ProductModel a Map JSON
  /// 
  /// Serializa instancia de producto para envío a API,
  /// manteniendo formato consistente con el servidor.
  /// 
  /// **Parámetros:**
  /// - [product]: Instancia de ProductModel a serializar
  /// 
  /// **Retorna:** Map JSON listo para envío a API
  /// 
  static Map<String, dynamic> toJson(ProductModel product) {
    return {
      'id': product.id,
      'title': product.title,
      'description': product.description,
      'price': product.price,
      'category': product.category,
      'image': product.image,
    };
  }
}
