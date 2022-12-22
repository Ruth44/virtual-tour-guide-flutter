import 'package:virtual_tour_guide_manager/data/building/bloc/bldg_bloc.dart';
import 'package:virtual_tour_guide_manager/data/building/model/building.dart';
import 'package:virtual_tour_guide_manager/data/building/repository/building_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'bldg_bloc_test.mocks.dart';

@GenerateMocks([BuildingRepository])
void main() {
  late MockBuildingRepository mockBuildingRepository;

  var mockBuildings = [
    Building(
        id: '6228f21c57a385827dc34af3',
        name: 'Century Mall',
        create: DateTime.parse('2022-06-19T12:59:02.025Z'),
        location: "Addis Ababa"),
    Building(
        id: '6228f23157a385827dc34af4',
        name: 'Edna Mall',
        create: DateTime.parse('2022-05-06T21:58:34.734Z'),
        location: "Addis Ababa"),
    Building(
        id: '6239fd935ea3bac63ce3c4c7',
        name: 'Morning Star Mall',
        create: DateTime.parse('2022-06-19T12:59:02.025Z'),
        location: "Addis Ababa"),
  ];

  setUp(() {
    mockBuildingRepository = MockBuildingRepository();
    // e = Exception();
  });

  group('Bldg Bloc Test', () {
    // test('Test get buildings', () async {
    //   when(mockBuildingRepository.getAllBuildings())
    //       .thenAnswer((realInvocation) async => mockBuildings);

    //   final bldgRes = await mockBuildingRepository.getAllBuildings();

    //   expect(bldgRes, equals(mockBuildings));
    // });

    blocTest(
      'emits [BldgLoadingState(), AllBldgLoadedState()] when not successful: (Test get buildings)',
      build: () {
        when(mockBuildingRepository.getAllBuildings())
            .thenAnswer((realInvocation) async => mockBuildings);

        return BldgBloc(buildingRepository: mockBuildingRepository);
      },
      act: (BldgBloc bloc) => bloc.add(const GetBuildings()),
      expect: () => [
        BldgLoadingState(),
        AllBldgLoadedState(mockBuildings),
        // ErrorBldgState("err")
      ],
    );

    blocTest(
      'emits [BldgLoadingState(), ErrorBldgState()] when not successful: (Test get buildings)',
      build: () {
        when(mockBuildingRepository.getAllBuildings())
            .thenAnswer((_) async => throw Exception());

        return BldgBloc(buildingRepository: mockBuildingRepository);
      },
      act: (BldgBloc bloc) => bloc.add(const GetBuildings()),
      expect: () => [BldgLoadingState(), ErrorBldgState("err")],
    );
  });
}
