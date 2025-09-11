import 'package:flutter/material.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/store_use_cases.dart';
import '../../core/error/failures.dart';

/// **Estados posibles del StoreProvider**
/// 
/// Define los estados del ciclo de vida para operaciones de carga de datos
/// desde APIs externas.
/// 
/// **Estados disponibles:**
/// - [initial]: Estado inicial, sin datos cargados
/// - [loading]: Cargando datos desde API
/// - [loaded]: Datos cargados exitosamente
/// - [error]: Error en carga de datos
enum StoreState { initial, loading, loaded, error }

/// **StoreProvider** - Proveedor de estado para datos de tienda
/// 
/// Provider principal que maneja el estado de la aplicación para todos
/// los datos relacionados con la tienda (productos, categorías, usuarios).
/// 
/// **Responsabilidades:**
/// - Gestionar estado de carga de datos desde APIs
/// - Proporcionar datos tipados a widgets consumidores
/// - Manejar errores de manera centralizada
/// - Notificar cambios de estado a la UI

class StoreProvider extends ChangeNotifier {
  final StoreUseCases _storeUseCases;

  /// **Constructor principal** - Inicializa StoreProvider con dependencias
  /// 
  /// Configura el provider con casos de uso inyectados y ejecuta
  /// inicialización automática del estado.
  /// 
  
  StoreProvider({
    required StoreUseCases storeUseCases,
  }) : _storeUseCases = storeUseCases {
    _initializeProvider();
  }

  StoreState _state = StoreState.initial;
  String _errorMessage = '';
  
  List<Product> _products = [];
  List<Category> _categories = [];
  List<User> _users = [];

  // Método privado para separar la lógica de inicialización
  void _initializeProvider() {
    _resetState();
    _logProviderInitialization();
  }

  void _resetState() {
    _state = StoreState.initial;
    _errorMessage = '';
    _products = [];
    _categories = [];
    _users = [];
  }

  void _logProviderInitialization() {
    print('[StoreProvider] Initialized with StoreUseCases');
  }

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
    
    final productsApiCallResult = await _storeUseCases.getProducts();
    productsApiCallResult.fold(
      (Failure apiFailureReason) => _setError('Error al cargar productos: ${apiFailureReason.message}'),
      (List<Product> fetchedProductsList) {
        _products = fetchedProductsList;
        _categories = [];
        _users = [];
        _setState(StoreState.loaded);
      },
    );
  }

  Future<void> loadCategories() async {
    _setState(StoreState.loading);
    
    final categoriesApiCallResult = await _storeUseCases.getCategories();
    categoriesApiCallResult.fold(
      (Failure apiFailureReason) => _setError('Error al cargar categorías: ${apiFailureReason.message}'),
      (List<Category> fetchedCategoriesList) {
        _categories = fetchedCategoriesList;
        _products = [];
        _users = [];
        _setState(StoreState.loaded);
      },
    );
  }

  Future<void> loadUsers() async {
    _setState(StoreState.loading);
    
    final usersApiCallResult = await _storeUseCases.getUsers();
    usersApiCallResult.fold(
      (Failure apiFailureReason) => _setError('Error al cargar usuarios: ${apiFailureReason.message}'),
      (List<User> fetchedUsersList) {
        _users = fetchedUsersList;
        _products = [];
        _categories = [];
        _setState(StoreState.loaded);
      },
    );
  }

  void _setState(StoreState newProviderState) {
    _state = newProviderState;
    if (newProviderState != StoreState.error) {
      _errorMessage = '';
    }
    notifyListeners();
  }

  void _setError(String userFriendlyErrorMessage) {
    _state = StoreState.error;
    _errorMessage = userFriendlyErrorMessage;
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
      for (Product product in _products) {
        print('${product.title} | \$${product.price}\n${product.description}\nCategoría: ${product.category}\n---');
      }
    }

    if (_categories.isNotEmpty) {
      print('\n--- Categorías ---');
      for (Category category in _categories) {
        print(category.name);
      }
    }

    if (_users.isNotEmpty) {
      print('\n--- Usuarios ---');
      for (User user in _users) {
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
    for (Product product in _products) {
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
    for (User user in _users) {
      print('ID: ${user.id}');
      print('Nombre de usuario: ${user.username}');
      print('Correo: ${user.email}');
      print('---');
    }
    print('Total de usuarios: ${_users.length}');
  }
}
