import '../../domain/entities/product.dart';

class ProductModel extends Product {
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

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: (json['price'] as num).toDouble(),
        category: json['category'],
        image: json['image'],
      );
}