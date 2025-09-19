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
  static UserModel fromJson(Map<String, dynamic> json) {
    try {
      final email = json['email'] as String;
      final username = json['username'] as String;

      if (email.trim().isEmpty) {
        throw FormatException('El email no puede estar vacío');
      }

      if (username.trim().isEmpty) {
        throw FormatException('El username no puede estar vacío');
      }

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

  static List<UserModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
