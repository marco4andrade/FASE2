import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/category_model.dart';
import '../models/product_model.dart';
import '../models/user_model.dart';
import '../mappers/mappers.dart';

/// **StoreApiService** - Servicio para operaciones de API de la tienda
/// 
/// Clase especializada en manejar todas las operaciones relacionadas
/// con las APIs de los elementos de una tienda (productos, categorías, usuarios).
/// 
/// **Responsabilidades:**
/// - Consumir endpoints de la API de FakeStore
/// - Manejar respuestas HTTP y errores de red
/// - Transformar datos JSON usando mappers especializados
/// - Proporcionar interfaz consistente para acceso a datos
class StoreApiService {
  /// **URL base de la API** - Endpoint principal de FakeStore API
  final baseUrl = 'https://fakestoreapi.com';

  /// **Obtener productos** - Recupera lista completa de productos de la tienda
  /// 
  /// Realiza petición GET al endpoint `/products` y transforma la respuesta
  /// JSON usando ProductMapper para garantizar tipado fuerte y validación.
  /// 
  /// **Retorna:** `Future<List<ProductModel>>`
  /// **Lanza:** `Exception` si hay error en la petición HTTP
  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return ProductMapper.fromJsonList(data);
    } else {
      throw Exception('Error al cargar productos: ${response.statusCode}');
    }
  }

  /// **Obtener categorías** - Recupera todas las categorías disponibles
  /// 
  /// Consulta el endpoint `/products/categories` que retorna array de strings
  /// con los nombres de las categorías. Usa CategoryMapper para transformación.
  /// 
  /// **Retorna:** `Future<List<CategoryModel>>`
  /// **Lanza:** `Exception` si hay error en la petición HTTP
  Future<List<CategoryModel>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/products/categories'));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return CategoryMapper.fromStringList(data);
    }
    throw Exception('Error al cargar categorías: ${response.statusCode}');
  }

  /// **Obtener usuarios** - Recupera lista de usuarios registrados
  /// 
  /// Petición GET al endpoint `/users` para obtener información de usuarios.
  /// Utiliza UserMapper para transformar y validar los datos JSON recibidos.
  /// 
  /// **Retorna:** `Future<List<UserModel>>`
  /// **Lanza:** `Exception` si hay error en la petición HTTP
  Future<List<UserModel>> fetchUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return UserMapper.fromJsonList(data);
    }
    throw Exception('Error al cargar usuarios: ${response.statusCode}');
  }
}
