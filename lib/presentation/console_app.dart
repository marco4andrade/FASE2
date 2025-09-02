import '../domain/usecases/get_products.dart';
import '../domain/usecases/get_categories.dart';
import '../domain/usecases/get_users.dart';
import '../core/usecases/usecase.dart';

void printProducts(List products) {
  print('\n--- Productos ---');
  for (var product in products) {
    print(
        '${product.title} | \$${product.price}\n${product.description}\nCategoría: ${product.category}\n---');
  }
}

void printCategories(List categories) {
  print('\n--- Categorías ---');
  for (var category in categories) {
    print('${category.name}');
  }
}

void printUsers(List users) {
  print('\n--- Usuarios ---');
  for (var user in users) {
    print('ID: ${user.id} | ${user.username} | ${user.email}');
  }
}

Future<void> runConsoleApp({
  required GetProducts getProducts,
  required GetCategories getCategories,
  required GetUsers getUsers,
}) async {
  print('== FASE 2 - Store API ==');

  final productsResult = await getProducts(NoParams());
  productsResult.fold(
    (failure) => print('Error al obtener productos: ${failure.message}'),
    printProducts,
  );

  final categoriesResult = await getCategories(NoParams());
  categoriesResult.fold(
    (failure) => print('Error al obtener categorías: ${failure.message}'),
    printCategories,
  );

  final usersResult = await getUsers(NoParams());
  usersResult.fold(
    (failure) => print('Error al obtener usuarios: ${failure.message}'),
    printUsers,
  );
}