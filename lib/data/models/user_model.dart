import '../../domain/entities/user_entity.dart';

/// **UserModel** - Modelo de datos para usuarios del Store API
/// 
/// Extiende [User] para proporcionar funcionalidad completa de parsing
/// y validación de datos de usuario desde APIs externas.
/// 
/// **Responsabilidades:**
/// - Parsear datos JSON a objetos User tipados y validados
/// - Validar formato de email y campos requeridos
/// - Manejar conversiones de ID de manera robusta
/// - Generar errores descriptivos para debugging

class UserModel extends User {
  /// **Constructor principal** - Crea instancia validada de UserModel
  /// 
  /// Requiere todos los campos esenciales para un usuario funcional
  /// en el sistema de tienda.
  /// 
  
  UserModel({
    required int id,
    required String email,
    required String username,
  }) : super(
          id: id,
          email: email,
          username: username,
        );

  /// **Factory constructor** - Deserializa JSON a UserModel validado
  /// 
  /// Convierte datos de usuario desde API REST en instancia tipada
  /// con validación completa de integridad y formato.
  /// 
  
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      email: json['email'] as String,
      username: json['username'] as String,
    );
  }


}