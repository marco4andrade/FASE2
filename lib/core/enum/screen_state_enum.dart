/// **ScreenStateEnum** - Estados genéricos para pantallas y providers
/// 
/// Enum genérico que define los estados del ciclo de vida para operaciones
/// de carga de datos desde APIs externas o procesamiento asíncrono.
/// 
/// **Estados disponibles:**
/// - [initial]: Estado inicial, sin datos procesados
/// - [loading]: Procesando datos (API calls, operaciones asíncronas)
/// - [loaded]: Datos procesados exitosamente
/// - [error]: Error durante el procesamiento
/// 
/// **Casos de uso:**
/// - Providers de estado (StoreProvider, UserProvider, etc.)
/// - Pantallas con carga de datos asíncrona
/// - Widgets que manejan estados de carga
/// - Componentes reutilizables con estados de UI
/// 
/// **Ventajas del diseño genérico:**
/// - ✅ **Reutilizable**: Puede ser usado por múltiples providers/pantallas
/// - ✅ **Consistente**: Estados uniformes en toda la aplicación
/// - ✅ **Mantenible**: Un solo punto de definición para estados de UI
/// - ✅ **Escalable**: Fácil agregar nuevos estados si es necesario
enum ScreenStateEnum { 
  /// **Estado inicial** - No se han iniciado operaciones
  initial, 
  
  /// **Estado de carga** - Procesando datos o ejecutando operaciones
  loading, 
  
  /// **Estado cargado** - Operación completada exitosamente
  loaded, 
  
  /// **Estado de error** - Error durante la operación
  error 
}

/// **Extensión para ScreenStateEnum** - Métodos de conveniencia
/// 
/// Proporciona métodos útiles para verificar estados específicos
/// sin necesidad de comparaciones directas en el código de UI.
extension ScreenStateEnumExtension on ScreenStateEnum {
  /// **¿Está cargando?** - Verifica si está en estado loading
  bool get isLoading => this == ScreenStateEnum.loading;
  
  /// **¿Tiene error?** - Verifica si está en estado error
  bool get hasError => this == ScreenStateEnum.error;
  
  /// **¿Tiene datos?** - Verifica si está en estado loaded
  bool get hasData => this == ScreenStateEnum.loaded;
  
  /// **¿Está inicial?** - Verifica si está en estado initial
  bool get isInitial => this == ScreenStateEnum.initial;
  
  /// **¿Puede mostrar contenido?** - Verifica si debe mostrar datos
  bool get canShowContent => this == ScreenStateEnum.loaded;
  
  /// **¿Debe mostrar loading?** - Verifica si debe mostrar indicador de carga
  bool get shouldShowLoading => this == ScreenStateEnum.loading;
}
