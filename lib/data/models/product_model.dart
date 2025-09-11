import '../../domain/entities/product_entity.dart';

/// **ProductModel** - Modelo de datos para productos del Store API
/// 
/// Extiende [Product] para agregar funcionalidad de parsing y validación
/// desde datos JSON provenientes de APIs externas.
/// 
/// **Responsabilidades:**
/// - Parsear datos JSON a objetos Product tipados
/// - Validar integridad de datos requeridos
/// - Manejar conversiones de tipos de manera segura
/// - Proporcionar mensajes de error contextuales
/// 
class ProductModel extends Product {
  /// **Constructor principal** - Crea una instancia de ProductModel
  /// 
  ProductModel({
    required int id,
    required String title,
    required String description,
    required double price,
    required String category,
    required String image,
  }) : super(
          id: id,
          title: title,
          description: description,
          price: price,
          category: category,
          image: image,
        );

  /// **Factory constructor** - Crea ProductModel desde datos JSON
  /// 
  /// Convierte un Map<String, dynamic> proveniente de una API REST
  /// en una instancia tipada y validada de ProductModel.
  /// 
  
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      category: json['category'] as String,
      image: json['image'] as String,
    );
  }


}