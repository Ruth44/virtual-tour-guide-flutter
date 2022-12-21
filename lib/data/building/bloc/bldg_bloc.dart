import 'package:ar_indoor_nav_admin/data/building/model/building.dart';
import 'package:ar_indoor_nav_admin/data/building/repository/building_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'bldg_event.dart';
part 'bldg_state.dart';

class BldgBloc extends Bloc<BldgEvent, BldgState> {
  final BuildingRepository buildingRepository;

  BldgBloc({required this.buildingRepository}) : super(InitialBldgState());

  @override
  Stream<BldgState> mapEventToState(
    BldgEvent event,
  ) async* {
    if (event is GetBuildings) {
      try {
        yield BldgLoadingState();
        final List<Building> bldgsResult =
            await buildingRepository.getAllBuildings();
        yield AllBldgLoadedState(bldgsResult);
      } catch (e) {
        print(e);
        yield const ErrorBldgState("error while getting all buildings");
      }
    }
  }
}
