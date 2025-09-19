import 'package:meta/meta.dart';

/// **UserModel** - Modelo de datos para usuarios del Store API
///
/// Representa un usuario con toda la información necesaria para la aplicación.
/// Este modelo maneja los datos que llegan desde la API y los expone
/// de manera tipada y segura a las capas superiores.
///
/// **Propiedades:**
/// * [id] (requerido): Identificador único numérico del usuario
/// * [email] (requerido): Dirección de correo electrónico del usuario
/// * [username] (requerido): Nombre de usuario único para identificación
@immutable
class UserModel {
  final int id;
  final String email;
  final String username;

  const UserModel({
    required this.id,
    required this.email,
    required this.username,
  });

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, email: ***@***.com)';
  }

  UserModel copyWith({int? id, String? email, String? username}) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
