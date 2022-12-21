import 'package:ar_indoor_nav_admin/data/account/account.dart';
import 'package:ar_indoor_nav_admin/data/bldg_detail/bloc/bldg_detail_bloc.dart';
import 'package:ar_indoor_nav_admin/data/bldg_detail/model/bldg_detail.dart';
import 'package:ar_indoor_nav_admin/data/building/model/building.dart';
import 'package:ar_indoor_nav_admin/data/building/repository/building_repository.dart';
import 'package:ar_indoor_nav_admin/data/categories/bloc/bloc.dart';
import 'package:ar_indoor_nav_admin/data/categories/models/categories.dart';
import 'package:ar_indoor_nav_admin/data/categories/repository/categories_repository.dart';
import 'package:ar_indoor_nav_admin/data/room/models/room.dart';
import 'package:ar_indoor_nav_admin/screens/building_detail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'category_bloc_test.mocks.dart';

@GenerateMocks([CategoriesRepository, AccountRepository])
void main() {
  late MockCategoriesRepository mockCategoriesRepository;
  late MockAccountRepository mockAccountRepository;

  var mockCategoriesData = [
    const Category(id: 'id1', name: 'Category1'),
    const Category(id: 'id2', name: 'Category2'),
    const Category(id: 'id3', name: 'Category3'),
    const Category(id: 'id4', name: 'Category4'),
  ];

  setUp(() {
    mockCategoriesRepository = MockCategoriesRepository();
    mockAccountRepository = MockAccountRepository();
  });

  group('description', () {
    blocTest(
      'emits [ CategoriesLoading(), CategoriesLoadSuccess()] when not successful: (Test get categories)',
      build: () {
        when(mockCategoriesRepository.getCategories(bldgId: 'abc'))
            .thenAnswer((_) async => mockCategoriesData);

        return CategoriesBloc(
            categoriesRepository: mockCategoriesRepository,
            accountRepository: mockAccountRepository);
      },
      act: (CategoriesBloc bloc) =>
          bloc.add(const CategoriesLoad(bldgId: 'abc')),
      expect: () => [
        CategoriesLoading(),
        CategoriesLoadSuccess(mockCategoriesData),
      ],
    );
    blocTest(
      'emits [ CategoriesLoading(), CategoriesOperationError()] when not successful: (Test get categories)',
      build: () {
        when(mockCategoriesRepository.getCategories(bldgId: 'abc'))
            .thenAnswer((_) async => throw Exception());

        return CategoriesBloc(
            categoriesRepository: mockCategoriesRepository,
            accountRepository: mockAccountRepository);
      },
      act: (CategoriesBloc bloc) =>
          bloc.add(const CategoriesLoad(bldgId: 'abc')),
      expect: () => [
        CategoriesLoading(),
        // CategoriesLoadSuccess(mockCategoriesData),
        const CategoriesOperationError(message: "failed to get categories"),
      ],
    );
  });
}
