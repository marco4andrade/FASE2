import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../data/datasources/store_api_service.dart';
import '../data/repositories/store_repository_impl.dart';
import 'usecases/store_use_cases.dart';
import '../presentation/providers/store_provider.dart';

class DependencyInjection {
  static List<SingleChildWidget> get providers {
    return _buildProvidersList();
  }

  // Método privado para separar la lógica de configuración de dependencias
  static List<SingleChildWidget> _buildProvidersList() {
    final dependencies = _createDependencies();
    return _configureProviders(dependencies);
  }

  static _Dependencies _createDependencies() {
    final storeApiService = StoreApiService();
    final storeRepository = StoreRepositoryImpl(storeApiService);
    final storeUseCases = StoreUseCases(storeRepository);
    
    return _Dependencies(
      storeApiService: storeApiService,
      storeRepository: storeRepository,
      storeUseCases: storeUseCases,
    );
  }

  static List<SingleChildWidget> _configureProviders(_Dependencies dependencies) {
    return [
      Provider<StoreApiService>.value(value: dependencies.storeApiService),
      Provider<StoreRepositoryImpl>.value(value: dependencies.storeRepository),
      Provider<StoreUseCases>.value(value: dependencies.storeUseCases),
      
      ChangeNotifierProvider<StoreProvider>(
        create: (BuildContext context) => StoreProvider(
          storeUseCases: dependencies.storeUseCases,
        ),
      ),
    ];
  }
}

// Clase privada para organizar las dependencias
class _Dependencies {
  final StoreApiService storeApiService;
  final StoreRepositoryImpl storeRepository;
  final StoreUseCases storeUseCases;

  const _Dependencies({
    required this.storeApiService,
    required this.storeRepository,
    required this.storeUseCases,
  });
}
