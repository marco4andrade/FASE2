import 'package:meta/meta.dart';
import '../../domain/entities/user.dart';

/// UserModel - Modelo de datos para usuarios del Store API
///
/// * [id] (requerido): Identificador único numérico del usuario que llega desde la API.
///   Utilizado para identificar de manera unívoca cada usuario en el sistema.
/// * [email] (requerido): Dirección de correo electrónico del usuario.
///   Email principal utilizado para autenticación y comunicación con el usuario.
/// * [username] (requerido): Nombre de usuario único para identificación.
///   Alias público que utiliza el usuario para interactuar en la plataforma.
@immutable
class UserModel extends User {
  /// **Constructor** - Crea una instancia inmutable de UserModel
  /// 
  /// **Parámetros:**
  /// - [id]: Identificador único del usuario
  /// - [email]: Dirección de correo electrónico
  /// - [username]: Nombre de usuario
  /// 
  const UserModel({
    required super.id,
    required super.email,
    required super.username,
  });

  /// **Representación string** - Para debugging y logging específico del modelo
  /// 
  /// Proporciona una representación específica del modelo con prefijo UserModel.
  /// 
  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, email: ***@***.com)';
  }

  /// **Copia con modificaciones** - Crea una nueva instancia con cambios
  /// 
  /// Útil para actualizaciones inmutables del usuario.
  /// 
  /// **Parámetros:**
  /// - [id]: Nuevo ID (opcional, mantiene el actual si es null)
  /// - [email]: Nuevo email (opcional, mantiene el actual si es null)
  /// - [username]: Nuevo username (opcional, mantiene el actual si es null)
  /// 
  UserModel copyWith({
    int? id,
    String? email,
    String? username,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
    );
  }
}
