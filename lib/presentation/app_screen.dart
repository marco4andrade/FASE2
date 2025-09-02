import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/store_provider.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fase 2 Store API')),
      body: Consumer<StoreProvider>(
        builder: (context, storeProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Estado de carga
                if (storeProvider.isLoading)
                  const Column(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text('Cargando datos...'),
                      SizedBox(height: 32),
                    ],
                  ),

                // Estado de error
                if (storeProvider.hasError)
                  Column(
                    children: [
                      Icon(Icons.error, color: Colors.red, size: 48),
                      const SizedBox(height: 16),
                      Text(
                        storeProvider.errorMessage,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.red),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: storeProvider.clearError,
                        child: const Text('Limpiar Error'),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),

                // Los 3 botones principales
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: storeProvider.isLoading 
                            ? null 
                            : () async {
                                await storeProvider.loadProducts();
                                if (storeProvider.hasData) {
                                  storeProvider.printProductsToConsole();
                                }
                              },
                        icon: const Icon(Icons.shopping_cart),
                        label: const Text('Imprimir Productos en Consola'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: storeProvider.isLoading 
                            ? null 
                            : () async {
                                await storeProvider.loadCategories();
                                if (storeProvider.hasData) {
                                  storeProvider.printCategoriesToConsole();
                                }
                              },
                        icon: const Icon(Icons.category),
                        label: const Text('Imprimir Categorías en Consola'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: storeProvider.isLoading 
                            ? null 
                            : () async {
                                await storeProvider.loadUsers();
                                if (storeProvider.hasData) {
                                  storeProvider.printUsersToConsole();
                                }
                              },
                        icon: const Icon(Icons.people),
                        label: const Text('Imprimir Usuarios en Consola'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}