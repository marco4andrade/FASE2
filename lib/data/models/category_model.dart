import 'package:meta/meta.dart';

/// **CategoryModel** - Modelo de datos para categorías del Store API
///
/// Representa una categoría con toda la información necesaria para la aplicación.
/// Este modelo maneja los datos que llegan desde la API y los expone
/// de manera tipada y segura a las capas superiores.
///
/// **Propiedades:**
/// * [name] (requerido): Nombre de la categoría que llega desde la API externa
@immutable
class CategoryModel {
  final String name;

  const CategoryModel({required this.name})
    : assert(name != '', 'Category name cannot be empty');

  @override
  String toString() {
    return 'CategoryModel(name: $name)';
  }

  CategoryModel copyWith({String? name}) {
    return CategoryModel(name: name ?? this.name);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CategoryModel && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
