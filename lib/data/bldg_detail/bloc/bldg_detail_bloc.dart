import 'package:ar_indoor_nav_admin/data/bldg_detail/model/bldg_detail.dart';
import 'package:bloc/bloc.dart';
import 'package:ar_indoor_nav_admin/data/building/repository/building_repository.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'bldg_detail_event.dart';
part 'bldg_detail_state.dart';

class BldgDetailBloc extends Bloc<BldgDetailEvent, BldgDetailState> {
  final BuildingRepository buildingRepository;

  BldgDetailBloc({required this.buildingRepository})
      : super(BldgDetailInitial());

  @override
  Stream<BldgDetailState> mapEventToState(
    BldgDetailEvent event,
  ) async* {
    if (event is GetBuildingDetails) {
      try {
        yield BldgDetailLoadingState();
        final BldgDetail bldgDetailResult =
            await buildingRepository.getBuildingDetails(event.id);

        yield BldgDetailsLoadedState(bldgDetailResult);
      } catch (e) {
        print(e);
        yield const ErrorBldgDetailState(
            "error while getting specific building detail");
      }
    }
  }
}
