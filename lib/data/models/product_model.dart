import 'package:meta/meta.dart';
import '../../domain/entities/product.dart';

/// ProductModel - Modelo de datos para productos del Store API
///
/// * [id] (requerido): Identificador único numérico del producto que llega desde la API.
///   Utilizado para identificar de manera unívoca cada producto en el catálogo.
/// * [title] (requerido): Nombre comercial del producto que se muestra al usuario.
///   Corresponde al título descriptivo que aparece en el listado de productos.
/// * [description] (requerido): Descripción detallada del producto que proviene de la API.
///   Contiene información completa sobre características, materiales y especificaciones.
/// * [price] (requerido): Precio actual del producto en formato decimal.
///   Representa el costo monetario que llega desde el servicio externo.
/// * [category] (requerido): Categoría a la que pertenece el producto.
///   Clasificación temática utilizada para organizar el catálogo de productos.
/// * [image] (requerido): URL completa de la imagen principal del producto.
///   Enlace HTTP/HTTPS que apunta a la imagen de presentación del producto.
/// * [rating] (opcional): Calificación y conteo de valoraciones del producto.
///   Objeto que contiene la puntuación promedio y el número total de reseñas.
@immutable
class ProductModel extends Product {
  /// **Constructor** - Crea una instancia inmutable de ProductModel
  /// 
  /// **Parámetros:**
  /// - [id]: Identificador único del producto
  /// - [title]: Nombre del producto
  /// - [description]: Descripción detallada
  /// - [price]: Precio del producto
  /// - [category]: Categoría a la que pertenece
  /// - [image]: URL de la imagen
  /// - [rating]: Rating del producto (opcional)
  /// 
  const ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.price,
    required super.category,
    required super.image,
    super.rating,
  });

  /// **Representación string** - Para debugging y logging específico del modelo
  /// 
  /// Proporciona una representación específica del modelo con prefijo ProductModel.
  /// 
  @override
  String toString() {
    final ratingStr = rating != null ? ', rating: ${rating!.rate}/5' : '';
    return 'ProductModel(id: $id, title: $title, price: \$${price.toStringAsFixed(2)}, category: $category$ratingStr)';
  }

  /// **Copia con modificaciones** - Crea una nueva instancia con cambios
  /// 
  /// Útil para actualizaciones inmutables del producto.
  /// 
  /// **Parámetros:**
  /// - [id]: Nuevo ID (opcional)
  /// - [title]: Nuevo título (opcional)
  /// - [description]: Nueva descripción (opcional)
  /// - [price]: Nuevo precio (opcional)
  /// - [category]: Nueva categoría (opcional)
  /// - [image]: Nueva imagen (opcional)
  /// - [rating]: Nuevo rating (opcional)
  /// 
  ProductModel copyWith({
    int? id,
    String? title,
    String? description,
    double? price,
    String? category,
    String? image,
    ProductRating? rating,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      category: category ?? this.category,
      image: image ?? this.image,
      rating: rating ?? this.rating,
    );
  }
}