import 'package:equatable/equatable.dart';
import 'package:ar_indoor_nav_admin/data/categories/models/categories.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class CategoriesLoad extends CategoryEvent {
  final String bldgId;
  const CategoriesLoad({required this.bldgId});

  @override
  List<Object> get props => [bldgId];
}

class CategoryCreate extends CategoryEvent {
  final String bldgId;
  final Category category;

  const CategoryCreate(this.category, this.bldgId);

  @override
  List<Object> get props => [category, bldgId];

  @override
  String toString() =>
      'Category Created {category: $category}, bldgId: $bldgId';
}

class CategoryUpdate extends CategoryEvent {
  final String bldgId;
  final Category category;

  const CategoryUpdate(this.category, this.bldgId);

  @override
  List<Object> get props => [category, bldgId];

  @override
  String toString() =>
      'Category Updated {category: $category}, bldgId: $bldgId';
}

class CategoryDelete extends CategoryEvent {
  final String bldgId;
  final Category category;

  const CategoryDelete(this.category, this.bldgId);

  @override
  List<Object> get props => [category, bldgId];

  @override
  toString() => 'Category Deleted {category: $category}, bldgId: $bldgId';
}
