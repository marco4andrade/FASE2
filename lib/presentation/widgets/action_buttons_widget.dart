import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/store_provider.dart';
import 'store_action_button.dart';

class ActionButtonsWidget extends StatelessWidget {
  const ActionButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StoreProvider>(
      builder: (BuildContext context, StoreProvider storeProvider, Widget? child) {
        return Column(
          children: [
            StoreActionButton(
              icon: Icons.shopping_cart,
              label: 'Imprimir Productos en Consola',
              backgroundColor: Colors.blue,
              isLoading: storeProvider.isLoading,
              onPressed: () => _handleProductsButtonPress(storeProvider),
            ),
            const SizedBox(height: 16),
            StoreActionButton(
              icon: Icons.category,
              label: 'Imprimir Categorías en Consola',
              backgroundColor: Colors.orange,
              isLoading: storeProvider.isLoading,
              onPressed: () => _handleCategoriesButtonPress(storeProvider),
            ),
            const SizedBox(height: 16),
            StoreActionButton(
              icon: Icons.people,
              label: 'Imprimir Usuarios en Consola',
              backgroundColor: Colors.green,
              isLoading: storeProvider.isLoading,
              onPressed: () => _handleUsersButtonPress(storeProvider),
            ),
          ],
        );
      },
    );
  }

  Future<void> _handleProductsButtonPress(StoreProvider storeProvider) async {
    await storeProvider.loadProducts();
    if (storeProvider.hasData) {
      storeProvider.printProductsToConsole();
    }
  }

  Future<void> _handleCategoriesButtonPress(StoreProvider storeProvider) async {
    await storeProvider.loadCategories();
    if (storeProvider.hasData) {
      storeProvider.printCategoriesToConsole();
    }
  }

  Future<void> _handleUsersButtonPress(StoreProvider storeProvider) async {
    await storeProvider.loadUsers();
    if (storeProvider.hasData) {
      storeProvider.printUsersToConsole();
    }
  }
}
