import 'package:flutter/material.dart';
import '../../data/models/product_model.dart';
import '../../data/models/category_model.dart';
import '../../data/models/user_model.dart';
import '../../core/usecases/store_use_cases.dart';
import '../../core/error/failures.dart';
import '../../core/enum/screen_state_enum.dart';

/// **StoreProvider** - Proveedor de estado para datos de tienda
///
/// Provider principal que maneja el estado de la aplicación para todos los datos
/// relacionados con la tienda (productos, categorías, usuarios) consumidos desde
/// la FakeStore API. Implementa el patrón ChangeNotifier para notificación reactiva.
///
/// **Funcionalidades principales:**
/// - Gestión de estados de carga (initial, loading, loaded, error)
/// - Carga asíncrona de productos, categorías y usuarios
/// - Manejo centralizado de errores con mensajes descriptivos
/// - Limpieza automática de datos entre diferentes tipos de carga
/// - Métodos de impresión en consola para debugging y visualización
/// - Notificación automática a widgets consumidores via Consumer<StoreProvider>
///
/// **Estados disponibles:**
/// - `isLoading`: Indica si hay una operación en curso
/// - `hasError`: Indica si ocurrió un error en la última operación
/// - `hasData`: Indica si hay datos válidos disponibles
///
/// **Datos expuestos:**
/// - `products`: Lista de ProductModel desde /products endpoint
/// - `categories`: Lista de CategoryModel desde /products/categories
/// - `users`: Lista de UserModel desde /users endpoint
class StoreProvider extends ChangeNotifier {
  final StoreUseCases _storeUseCases;

  StoreProvider({required StoreUseCases storeUseCases})
    : _storeUseCases = storeUseCases {
    _initializeProvider();
  }

  ScreenStateEnum _state = ScreenStateEnum.initial;
  String _errorMessage = '';

  List<ProductModel> _products = [];
  List<CategoryModel> _categories = [];
  List<UserModel> _users = [];

  void _initializeProvider() {
    _resetState();
    _logProviderInitialization();
  }

  void _resetState() {
    _state = ScreenStateEnum.initial;
    _errorMessage = '';
    _products = [];
    _categories = [];
    _users = [];
  }

  void _logProviderInitialization() {
    print('[StoreProvider] Initialized with StoreUseCases');
  }

  ScreenStateEnum get state => _state;
  String get errorMessage => _errorMessage;
  List<ProductModel> get products => _products;
  List<CategoryModel> get categories => _categories;
  List<UserModel> get users => _users;

  bool get isLoading => _state.isLoading;
  bool get hasError => _state.hasError;
  bool get hasData => _state.hasData;

  Future<void> loadProducts() async {
    _setState(ScreenStateEnum.loading);

    final productsApiCallResult = await _storeUseCases.getProducts();
    productsApiCallResult.fold(
      (DomainError apiErrorReason) =>
          _setError('Error al cargar productos: ${apiErrorReason.message}'),
      (List<ProductModel> fetchedProductsList) {
        _products = fetchedProductsList;
        _categories = [];
        _users = [];
        _setState(ScreenStateEnum.loaded);
      },
    );
  }

  Future<void> loadCategories() async {
    _setState(ScreenStateEnum.loading);

    final categoriesApiCallResult = await _storeUseCases.getCategories();
    categoriesApiCallResult.fold(
      (DomainError apiErrorReason) =>
          _setError('Error al cargar categorías: ${apiErrorReason.message}'),
      (List<CategoryModel> fetchedCategoriesList) {
        _categories = fetchedCategoriesList;
        _products = [];
        _users = [];
        _setState(ScreenStateEnum.loaded);
      },
    );
  }

  Future<void> loadUsers() async {
    _setState(ScreenStateEnum.loading);

    final usersApiCallResult = await _storeUseCases.getUsers();
    usersApiCallResult.fold(
      (DomainError apiErrorReason) =>
          _setError('Error al cargar usuarios: ${apiErrorReason.message}'),
      (List<UserModel> fetchedUsersList) {
        _users = fetchedUsersList;
        _products = [];
        _categories = [];
        _setState(ScreenStateEnum.loaded);
      },
    );
  }

  void _setState(ScreenStateEnum newProviderState) {
    _state = newProviderState;
    if (newProviderState != ScreenStateEnum.error) {
      _errorMessage = '';
    }
    notifyListeners();
  }

  void _setError(String userFriendlyErrorMessage) {
    _state = ScreenStateEnum.error;
    _errorMessage = userFriendlyErrorMessage;
    notifyListeners();
  }

  void clearError() {
    if (_state.hasError) {
      _setState(ScreenStateEnum.initial);
    }
  }

  void printDataToConsole() {
    if (!_state.canShowContent) return;

    print('\n== FASE 2 - Store API ==');

    if (_products.isNotEmpty) {
      print('\n--- Productos ---');
      for (ProductModel product in _products) {
        print(
          '${product.title} | \$${product.price}\n${product.description}\nCategoría: ${product.category}\n---',
        );
      }
    }

    if (_categories.isNotEmpty) {
      print('\n--- Categorías ---');
      for (CategoryModel category in _categories) {
        print(category.name);
      }
    }

    if (_users.isNotEmpty) {
      print('\n--- Usuarios ---');
      for (UserModel user in _users) {
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
    for (ProductModel product in _products) {
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
    for (UserModel user in _users) {
      print('ID: ${user.id}');
      print('Nombre de usuario: ${user.username}');
      print('Correo: ${user.email}');
      print('---');
    }
    print('Total de usuarios: ${_users.length}');
  }
}
