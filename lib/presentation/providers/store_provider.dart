import 'package:flutter/material.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/get_products.dart';
import '../../domain/usecases/get_categories.dart';
import '../../domain/usecases/get_users.dart';
import '../../core/usecases/usecase.dart';

enum StoreState { initial, loading, loaded, error }

class StoreProvider extends ChangeNotifier {
  final GetProducts _getProducts;
  final GetCategories _getCategories;
  final GetUsers _getUsers;

  StoreProvider({
    required GetProducts getProducts,
    required GetCategories getCategories,
    required GetUsers getUsers,
  })  : _getProducts = getProducts,
        _getCategories = getCategories,
        _getUsers = getUsers;

  StoreState _state = StoreState.initial;
  String _errorMessage = '';
  
  List<Product> _products = [];
  List<Category> _categories = [];
  List<User> _users = [];

  StoreState get state => _state;
  String get errorMessage => _errorMessage;
  List<Product> get products => _products;
  List<Category> get categories => _categories;
  List<User> get users => _users;

  bool get isLoading => _state == StoreState.loading;
  bool get hasError => _state == StoreState.error;
  bool get hasData => _state == StoreState.loaded;

  Future<void> loadProducts() async {
    _setState(StoreState.loading);
    
    final result = await _getProducts(NoParams());
    result.fold(
      (failure) => _setError('Error al cargar productos: ${failure.message}'),
      (products) {
        _products = products;
        _categories = [];
        _users = [];
        _setState(StoreState.loaded);
      },
    );
  }

  Future<void> loadCategories() async {
    _setState(StoreState.loading);
    
    final result = await _getCategories(NoParams());
    result.fold(
      (failure) => _setError('Error al cargar categorías: ${failure.message}'),
      (categories) {
        _categories = categories;
        _products = [];
        _users = [];
        _setState(StoreState.loaded);
      },
    );
  }

  Future<void> loadUsers() async {
    _setState(StoreState.loading);
    
    final result = await _getUsers(NoParams());
    result.fold(
      (failure) => _setError('Error al cargar usuarios: ${failure.message}'),
      (users) {
        _users = users;
        _products = [];
        _categories = [];
        _setState(StoreState.loaded);
      },
    );
  }

  void _setState(StoreState newState) {
    _state = newState;
    if (newState != StoreState.error) {
      _errorMessage = '';
    }
    notifyListeners();
  }

  void _setError(String message) {
    _state = StoreState.error;
    _errorMessage = message;
    notifyListeners();
  }

  void clearError() {
    if (_state == StoreState.error) {
      _setState(StoreState.initial);
    }
  }

  void printDataToConsole() {
    if (_state != StoreState.loaded) return;

    print('\n== FASE 2 - Store API ==');
    
    if (_products.isNotEmpty) {
      print('\n--- Productos ---');
      for (var product in _products) {
        print('${product.title} | \$${product.price}\n${product.description}\nCategoría: ${product.category}\n---');
      }
    }

    if (_categories.isNotEmpty) {
      print('\n--- Categorías ---');
      for (var category in _categories) {
        print(category.name);
      }
    }

    if (_users.isNotEmpty) {
      print('\n--- Usuarios ---');
      for (var user in _users) {
        print('ID: ${user.id} | ${user.username} | ${user.email}');
      }
    }
  }

  void printProductsToConsole() {
    if (_products.isEmpty) {
      print('\n--- No hay productos disponibles ---');
      return;
    }

    print('\n== PRODUCTOS ==');
    for (var product in _products) {
      print('ID: ${product.id}');
      print('Título: ${product.title}');
      print('Descripción: ${product.description}');
      print('Precio: \$${product.price}');
      print('Categoría: ${product.category}');
      print('Imagen: ${product.image}');
      print('---');
    }
    print('Total de productos: ${_products.length}');
  }

  void printCategoriesToConsole() {
    if (_categories.isEmpty) {
      print('\n--- No hay categorías disponibles ---');
      return;
    }

    print('\n== CATEGORÍAS ==');
    for (int i = 0; i < _categories.length; i++) {
      print('${i + 1}. ${_categories[i].name.toUpperCase()}');
    }
    print('Total de categorías: ${_categories.length}');
  }

  void printUsersToConsole() {
    if (_users.isEmpty) {
      print('\n--- No hay usuarios disponibles ---');
      return;
    }

    print('\n== USUARIOS ==');
    for (var user in _users) {
      print('ID: ${user.id}');
      print('Username: ${user.username}');
      print('Email: ${user.email}');
      print('---');
    }
    print('Total de usuarios: ${_users.length}');
  }
}
