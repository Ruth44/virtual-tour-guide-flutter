import 'package:ar_indoor_nav_admin/data/bldg_detail/bloc/bldg_detail_bloc.dart';
import 'package:ar_indoor_nav_admin/data/bldg_detail/model/bldg_detail.dart';
import 'package:ar_indoor_nav_admin/data/building/model/building.dart';
import 'package:ar_indoor_nav_admin/data/building/repository/building_repository.dart';
import 'package:ar_indoor_nav_admin/data/categories/models/categories.dart';
import 'package:ar_indoor_nav_admin/data/room/models/room.dart';
import 'package:ar_indoor_nav_admin/screens/building_detail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'bldg_detail_bloc_test.mocks.dart';

@GenerateMocks([BuildingRepository])
void main() {
  late MockBuildingRepository mockBuildingRepository;

  var mockBuildingDetail = BldgDetail(
    id: '6228f21c57a385827dc34af3',
    name: 'Century Mall',
    rooms: [
      Room(
        id: '6266b13923bd56a00765e522',
        roomName: 'Mahi bridal shop',
        roomNumber: "201",
        floorNumber: "2",
        bldgId: '6228f21c57a385827dc34af3',
        isEmpty: false,
        createdAt: DateTime.parse('2022-06-19T12:59:02.025Z'),
        category: const Category(
          id: "6266b0cf23bd56a00765e51c",
          name: "Bridal shops",
        ),
      ),
      Room(
        id: '6266b19323bd56a00765e527',
        roomName: 'Miracle design',
        roomNumber: "202",
        floorNumber: "2",
        bldgId: '6228f21c57a385827dc34af3',
        isEmpty: false,
        createdAt: DateTime.parse('2022-04-25T14:34:59.622Z'),
        category: const Category(
          id: "627d7ab024c5aeee566fae61",
          name: "Habesha Clothing stores",
        ),
      ),
    ],
  );

  setUp(() {
    mockBuildingRepository = MockBuildingRepository();
    // e = Exception();
  });

  group('description', () {
    blocTest(
      'emits [BldgLoadingState(), ErrorBldgState()] when not successful: (Test get buildings)',
      build: () {
        when(mockBuildingRepository.getBuildingDetails(any))
            .thenAnswer((_) async => mockBuildingDetail);

        return BldgDetailBloc(buildingRepository: mockBuildingRepository);
      },
      act: (BldgDetailBloc bloc) =>
          bloc.add(const GetBuildingDetails(id: 'abc')),
      expect: () => [
        BldgDetailLoadingState(),
        BldgDetailsLoadedState(mockBuildingDetail),
      ],
    );
  });
}
