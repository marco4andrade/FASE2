import 'package:meta/meta.dart';

/// **ProductModel** - Modelo de datos para productos del Store API
///
/// Representa un producto con toda la información necesaria para la aplicación.
/// Este modelo maneja los datos que llegan desde la API y los expone
/// de manera tipada y segura a las capas superiores.
///
/// **Propiedades:**
/// * [id] (requerido): Identificador único numérico del producto
/// * [title] (requerido): Nombre comercial del producto
/// * [description] (requerido): Descripción detallada del producto
/// * [price] (requerido): Precio actual del producto en formato decimal
/// * [category] (requerido): Categoría a la que pertenece el producto
/// * [image] (requerido): URL completa de la imagen principal del producto
/// * [rating] (opcional): Calificación y conteo de valoraciones del producto
@immutable
class ProductModel {
  final int id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String image;
  final ProductRating? rating;
  const ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
    this.rating,
  });

  @override
  String toString() {
    final ratingStr = rating != null ? ', rating: ${rating!.rate}/5' : '';
    return 'ProductModel(id: $id, title: $title, price: \$${price.toStringAsFixed(2)}, category: $category$ratingStr)';
  }

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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProductModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

/// **ProductRating** - Modelo para rating de productos
///
/// Representa la información de calificación de un producto.
@immutable
class ProductRating {
  final double rate;
  final int count;

  const ProductRating({required this.rate, required this.count});

  @override
  String toString() {
    return 'ProductRating{rate: $rate, count: $count}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProductRating && other.rate == rate && other.count == count;
  }

  @override
  int get hashCode => rate.hashCode ^ count.hashCode;
}
