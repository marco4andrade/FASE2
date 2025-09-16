/// **Product Entity** - Entidad de dominio para productos
/// 
/// Representa el concepto central de producto en el dominio de negocio.
/// Contiene solo la lógica de negocio esencial sin dependencias externas.
/// 
/// En Clean Architecture, las entidades son el núcleo del dominio y 
/// contienen las reglas de negocio más generales y de alto nivel.
class Product {
  /// **ID del producto** - Identificador único del producto
  final int id;
  
  /// **Título del producto** - Nombre descriptivo del producto
  final String title;
  
  /// **Descripción del producto** - Información detallada del producto
  final String description;
  
  /// **Precio del producto** - Valor monetario del producto
  final double price;
  
  /// **Categoría del producto** - Clasificación del producto
  final String category;
  
  /// **URL de la imagen** - Enlace a la imagen del producto
  final String image;
  
  /// **Rating del producto** - Información de calificación (opcional)
  final ProductRating? rating;

  /// **Constructor** - Crea una nueva instancia de producto
  /// 
  /// **Parámetros:**
  /// - [id]: ID único del producto (requerido)
  /// - [title]: Título del producto (requerido)
  /// - [description]: Descripción del producto (requerido)
  /// - [price]: Precio del producto (requerido)
  /// - [category]: Categoría del producto (requerido) 
  /// - [image]: URL de la imagen (requerido)
  /// - [rating]: Rating del producto (opcional)
  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
    this.rating,
  });

  /// **toString** - Representación string para debugging
  @override
  String toString() {
    final ratingStr = rating != null ? ', rating: ${rating!.rate}/5' : '';
    return 'Product{id: $id, title: $title, price: \$${price.toStringAsFixed(2)}, category: $category$ratingStr}';
  }

  /// **Equality operator** - Compara productos por ID
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Product && other.id == id;
  }

  /// **hashCode** - Hash code basado en ID
  @override
  int get hashCode => id.hashCode;
}

/// **ProductRating Entity** - Entidad para rating de productos
/// 
/// Representa la información de calificación de un producto.
class ProductRating {
  /// **Rate** - Calificación promedio (0.0 - 5.0)
  final double rate;
  
  /// **Count** - Número total de calificaciones
  final int count;

  /// **Constructor** - Crea una nueva instancia de rating
  const ProductRating({
    required this.rate,
    required this.count,
  });

  /// **toString** - Representación string para debugging
  @override
  String toString() {
    return 'ProductRating{rate: $rate, count: $count}';
  }

  /// **Equality operator** - Compara ratings por rate y count
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProductRating && 
           other.rate == rate && 
           other.count == count;
  }

  /// **hashCode** - Hash code basado en rate y count
  @override
  int get hashCode => rate.hashCode ^ count.hashCode;
}
