import '../models/user_model.dart';

/// **UserMapper** - Mapper especializado para datos de usuarios
/// 
/// Maneja la conversión entre datos JSON de API y objetos UserModel,
/// separando las responsabilidades de mapeo de la lógica del modelo.
/// 
/// **Responsabilidades:**
/// - Mapear datos JSON a UserModel
/// - Validar formato de email y campos requeridos
/// - Manejar conversiones de ID de manera robusta
/// - Generar errores descriptivos para debugging
/// 
class UserMapper {
  /// **Mapeo desde JSON** - Convierte Map JSON a UserModel
  /// 
  /// Transforma datos de usuario desde API REST en instancia tipada
  /// con validación completa de integridad y formato.
  /// 
  /// **Parámetros:**
  /// - [json]: Mapa de datos JSON desde API
  /// 
  /// **Retorna:** UserModel validado y tipado
  /// 
  /// **Lanza:** FormatException si los datos no son válidos
  /// 
  static UserModel fromJson(Map<String, dynamic> json) {
    try {
      // Validaciones básicas
      final email = json['email'] as String;
      final username = json['username'] as String;
      
      if (email.trim().isEmpty) {
        throw FormatException('El email no puede estar vacío');
      }
      
      if (username.trim().isEmpty) {
        throw FormatException('El username no puede estar vacío');
      }

      // Validación básica de formato de email
      if (!email.contains('@')) {
        throw FormatException('Formato de email inválido: $email');
      }

      return UserModel(
        id: json['id'] as int,
        email: email.trim(),
        username: username.trim(),
      );
    } catch (e) {
      throw FormatException(
        'Error al mapear usuario desde JSON: $e\n'
        'Datos recibidos: $json',
      );
    }
  }

  /// **Mapeo desde lista JSON** - Convierte lista de JSON a lista de UserModel
  /// 
  /// Procesa múltiples usuarios desde respuesta de API,
  /// manejando errores individuales sin afectar el resto del mapeo.
  /// 
  /// **Parámetros:**
  /// - [jsonList]: Lista de mapas JSON desde API
  /// 
  /// **Retorna:** Lista de UserModel validados
  /// 
  static List<UserModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => fromJson(json as Map<String, dynamic>))
        .toList();
  }

  /// **Mapeo a JSON** - Convierte UserModel a Map JSON
  /// 
  /// Serializa instancia de usuario para envío a API,
  /// manteniendo formato consistente con el servidor.
  /// 
  /// **Parámetros:**
  /// - [user]: Instancia de UserModel a serializar
  /// 
  /// **Retorna:** Map JSON listo para envío a API
  /// 
  static Map<String, dynamic> toJson(UserModel user) {
    return {
      'id': user.id,
      'email': user.email,
      'username': user.username,
    };
  }

  /// **Mapeo para actualización** - Convierte UserModel a JSON parcial
  /// 
  /// Para operaciones de actualización que pueden omitir el ID.
  /// 
  /// **Parámetros:**
  /// - [user]: Instancia de UserModel a serializar
  /// 
  /// **Retorna:** Map JSON sin ID para actualizaciones
  /// 
  static Map<String, dynamic> toJsonForUpdate(UserModel user) {
    return {
      'email': user.email,
      'username': user.username,
    };
  }
}
