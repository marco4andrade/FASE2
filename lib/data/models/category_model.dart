import '../../domain/entities/category.dart';

class CategoryModel extends Category {
  CategoryModel({required String name}) : super(name: name);

  factory CategoryModel.fromJson(String name) => CategoryModel(name: name);
}