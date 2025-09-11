import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../data/datasources/remote_datasource.dart';
import '../data/repositories/store_repository_impl.dart';
import '../domain/usecases/store_use_cases.dart';
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
    final remoteDataSource = RemoteDataSource();
    final storeRepository = StoreRepositoryImpl(remoteDataSource);
    final storeUseCases = StoreUseCases(storeRepository);
    
    return _Dependencies(
      remoteDataSource: remoteDataSource,
      storeRepository: storeRepository,
      storeUseCases: storeUseCases,
    );
  }

  static List<SingleChildWidget> _configureProviders(_Dependencies dependencies) {
    return [
      Provider<RemoteDataSource>.value(value: dependencies.remoteDataSource),
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
  final RemoteDataSource remoteDataSource;
  final StoreRepositoryImpl storeRepository;
  final StoreUseCases storeUseCases;

  const _Dependencies({
    required this.remoteDataSource,
    required this.storeRepository,
    required this.storeUseCases,
  });
}
