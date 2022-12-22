import 'package:virtual_tour_guide_manager/data/categories/data_provider/category_data.dart';
import 'package:virtual_tour_guide_manager/data/categories/models/categories.dart';

class CategoriesRepository {
  final CategoriesDataProvider dataProvider;

  CategoriesRepository({required this.dataProvider});

  Future<Category> createCategory(
      Category category, String bldgId, String token) async {
    return await dataProvider.createCategory(category, bldgId, token);
  }

  Future<List<Category>> getCategories({required String bldgId}) async {
    return await dataProvider.getCategories(bldgId: bldgId);
  }

  Future<void> updateCategory(Category category, String token) async {
    await dataProvider.updateCategory(category, token);
  }

  Future<void> deleteCategory(String id, String bldgId, String token) async {
    await dataProvider.deleteCategory(id, bldgId, token);
  }
}
