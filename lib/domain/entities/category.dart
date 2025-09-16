/// **Category Entity** - Entidad de dominio para categorías
/// 
/// Representa el concepto central de categoría en el dominio de negocio.
/// En Clean Architecture, esta entidad contiene solo la lógica de negocio
/// esencial sin dependencias de frameworks o bibliotecas externas.
class Category {
  /// **Nombre de la categoría** - Identificador único de la categoría
  final String name;

  /// **Constructor** - Crea una nueva instancia de categoría
  /// 
  /// **Parámetros:**
  /// - [name]: Nombre de la categoría (requerido, no puede estar vacío)
  /// 
  /// **Validaciones:**
  /// - El nombre no puede estar vacío o ser solo espacios en blanco
  const Category({required this.name}) : assert(name != '', 'Category name cannot be empty');

  /// **toString** - Representación string para debugging
  @override
  String toString() {
    return 'Category{name: $name}';
  }

  /// **Equality operator** - Compara categorías por nombre
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Category && other.name == name;
  }

  /// **hashCode** - Hash code basado en el nombre
  @override
  int get hashCode => name.hashCode;

  /// **Business Logic Methods** - Métodos de lógica de negocio

  /// **isValid** - Valida si la categoría es válida
  /// 
  /// **Retorna:** `true` si la categoría tiene un nombre válido
  bool get isValid => name.trim().isNotEmpty;

  /// **normalizedName** - Retorna el nombre normalizado
  /// 
  /// **Retorna:** Nombre en minúsculas y sin espacios extras
  String get normalizedName => name.trim().toLowerCase();

  /// **displayName** - Retorna el nombre formateado para mostrar
  /// 
  /// **Retorna:** Nombre con primera letra en mayúscula
  String get displayName {
    if (name.isEmpty) return name;
    return name[0].toUpperCase() + name.substring(1).toLowerCase();
  }
}
