import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:step2/data/models/category_model.dart';
import 'package:step2/data/models/product_model.dart';
import 'package:step2/data/models/user_model.dart';

class RemoteDataSource {
  final baseUrl = 'https://fakestorewwwwwapi.com';

  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((item) => ProductModel.fromJson(item)).toList();
    } else {
      throw Exception('Error al cargar productos');
    }
  }

  Future<List<CategoryModel>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/products/categories'));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data
          .map((name) => CategoryModel.fromJson(name as String))
          .toList();
    }
    throw Exception('Error al cargar categorías: ${response.statusCode}');
  }

  Future<List<UserModel>> fetchUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => UserModel.fromJson(e)).toList();
    }
    throw Exception('Error al cargar usuarios: ${response.statusCode}');
  }
}
