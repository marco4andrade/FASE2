import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../data/datasources/store_api_service.dart';
import '../data/repositories/store_repository_impl.dart';
import '../core/usecases/store_use_cases.dart';
import '../presentation/providers/store_provider.dart';

/// **StoreProviderConfig** - Configuración centralizada de dependencias
///
/// Maneja la inyección de dependencias completa de la aplicación siguiendo
/// Clean Architecture. Configura automáticamente toda la cadena de dependencias
/// desde el servicio API hasta el provider de UI de manera ordenada y simple.
///
/// **Arquitectura de dependencias:**
/// - StoreApiService: Comunicación HTTP con FakeStore API
/// - StoreRepositoryImpl: Implementación del contrato de repositorio
/// - StoreUseCases: Casos de uso centralizados para lógica de negocio
/// - StoreProvider: Provider reactivo para gestión de estado en UI
///
/// **Funcionalidades:**
/// - Inyección automática de todas las dependencias
/// - Configuración en orden jerárquico correcto
/// - Lista de providers lista para MultiProvider
/// - Patrón Singleton implícito para servicios compartidos
/// - Fácil extensión para nuevos providers o dependencias
///

class StoreProviderConfig {
  static List<SingleChildWidget> get providers {
    return _buildProvidersList();
  }

  static List<SingleChildWidget> _buildProvidersList() {
    final storeApiService = StoreApiService();
    final storeRepository = StoreRepositoryImpl(storeApiService);
    final storeUseCases = StoreUseCases(storeRepository);

    return [
      ChangeNotifierProvider(
        create: (_) => StoreProvider(storeUseCases: storeUseCases),
      ),
    ];
  }
}
