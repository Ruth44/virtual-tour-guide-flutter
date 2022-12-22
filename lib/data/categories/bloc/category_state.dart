import 'package:equatable/equatable.dart';
import 'package:virtual_tour_guide_manager/data/categories/models/categories.dart';

class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

class CategoriesLoading extends CategoriesState {}

class CategoriesLoadSuccess extends CategoriesState {
  final List<Category> categories;

  const CategoriesLoadSuccess([this.categories = const []]);

  @override
  List<Object> get props => [categories];
}

class CategoriesOperationError extends CategoriesState {
  final String message;

  const CategoriesOperationError({required this.message});

  @override
  List<Object> get props => [message];
}
