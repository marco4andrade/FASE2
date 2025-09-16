/// **User Entity** - Entidad de dominio para usuarios
/// 
/// Representa el concepto central de usuario en el dominio de negocio.
/// En Clean Architecture, las entidades contienen las reglas de negocio
/// más importantes y son independientes de frameworks externos.
class User {
  /// **ID del usuario** - Identificador único del usuario
  final int id;
  
  /// **Email del usuario** - Dirección de correo electrónico
  final String email;
  
  /// **Nombre de usuario** - Username único del usuario
  final String username;

  /// **Constructor** - Crea una nueva instancia de usuario
  /// 
  /// **Parámetros:**
  /// - [id]: ID único del usuario (requerido)
  /// - [email]: Email del usuario (requerido)
  /// - [username]: Username único (requerido)
  const User({
    required this.id,
    required this.email,
    required this.username,
  });

  /// **toString** - Representación string para debugging (sin datos sensibles)
  @override
  String toString() {
    return 'User{id: $id, username: $username, email: ${_obfuscateEmail(email)}}';
  }

  /// **Equality operator** - Compara usuarios por ID
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User && other.id == id;
  }

  /// **hashCode** - Hash code basado en ID
  @override
  int get hashCode => id.hashCode;

  /// **Business Logic Methods** - Métodos de lógica de negocio

  /// **isValidEmail** - Valida si el email tiene formato válido
  bool get isValidEmail => email.contains('@') && email.contains('.');

  /// **_obfuscateEmail** - Ofusca el email para logging seguro
  String _obfuscateEmail(String email) {
    final parts = email.split('@');
    if (parts.length != 2) return email;
    final username = parts[0];
    final domain = parts[1];
    final obfuscatedUsername = username.length > 2 
        ? '${username.substring(0, 2)}***' 
        : username;
    return '$obfuscatedUsername@$domain';
  }
}


