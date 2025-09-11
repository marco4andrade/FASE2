import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/store_provider.dart';
import 'widgets/loading_widget.dart';
import 'widgets/error_display_widget.dart';
import 'widgets/action_buttons_widget.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fase 2 Store API')),
      body: Consumer<StoreProvider>(
        builder: (BuildContext context, StoreProvider storeProvider, Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Estado de carga
                if (storeProvider.isLoading) const LoadingWidget(),

                // Estado de error
                if (storeProvider.hasError)
                  ErrorDisplayWidget(
                    errorMessage: storeProvider.errorMessage,
                    onClearError: storeProvider.clearError,
                  ),

                // Los 3 botones principales
                const ActionButtonsWidget(),
              ],
            ),
          );
        },
      ),
    );
  }
}