import 'dart:io';

import 'package:ar_indoor_nav_admin/data/account/account.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ar_indoor_nav_admin/data/categories/repository/categories_repository.dart';
import 'bloc.dart';

class CategoriesBloc extends Bloc<CategoryEvent, CategoriesState> {
  final CategoriesRepository categoriesRepository;
  final AccountRepository accountRepository;

  CategoriesBloc({
    required this.categoriesRepository,
    required this.accountRepository,
  }) : super(CategoriesLoading());

  @override
  Stream<CategoriesState> mapEventToState(CategoryEvent event) async* {
    if (event is CategoriesLoad) {
      yield CategoriesLoading();
      try {
        final categoriesList =
            await categoriesRepository.getCategories(bldgId: event.bldgId);
        yield CategoriesLoadSuccess(categoriesList);
      } catch (_) {
        yield const CategoriesOperationError(
            message: "failed to get categories");
      }
    } else if (event is CategoryCreate) {
      try {
        yield CategoriesLoading();
        String? token =
            await accountRepository.localDataProvider.readJWTToken();
        await categoriesRepository.createCategory(
            event.category, event.bldgId, token!);
        final categoriesList =
            await categoriesRepository.getCategories(bldgId: event.bldgId);
        yield CategoriesLoadSuccess(categoriesList);
      } catch (_) {
        yield const CategoriesOperationError(
            message: "failed to create category!");
      }
    } else if (event is CategoryUpdate) {
      try {
        yield CategoriesLoading();
        String? token =
            await accountRepository.localDataProvider.readJWTToken();
        await categoriesRepository.updateCategory(event.category, token!);
        final categoriesList =
            await categoriesRepository.getCategories(bldgId: event.bldgId);

        yield CategoriesLoadSuccess(categoriesList);
      } catch (_) {
        yield const CategoriesOperationError(
            message: "failed to update category. !");
      }
    } else if (event is CategoryDelete) {
      try {
        yield CategoriesLoading();
        String? token =
            await accountRepository.localDataProvider.readJWTToken();
        await categoriesRepository.deleteCategory(
            event.category.id!, event.bldgId, token!);
        final categoriesList =
            await categoriesRepository.getCategories(bldgId: event.bldgId);
        yield CategoriesLoadSuccess(categoriesList);
      } on SocketException catch (e) {
        yield const CategoriesOperationError(message: "Connection issues");
      } on Exception catch (e) {
        // yield const CategoriesOperationError(
        //     message: "Category selected being used");
        yield CategoriesOperationError(
            message: "${e.toString().substring(11)}");
        // yield const CategoriesOperationError(
        //     message: "failed to delete category!");
      } catch (_) {
        yield const CategoriesOperationError(
            message: "failed to delete category!");
      }
    } else {}
  }
}
