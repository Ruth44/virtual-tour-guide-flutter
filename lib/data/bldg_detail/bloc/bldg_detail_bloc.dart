import 'dart:developer';

import 'package:virtual_tour_guide_manager/data/bldg_detail/model/bldg_detail.dart';
import 'package:bloc/bloc.dart';
import 'package:virtual_tour_guide_manager/data/building/repository/building_repository.dart';
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
        // log(bldgDetailResult.name);

        yield BldgDetailsLoadedState(bldgDetailResult);
      } catch (e) {
        // print(e);
        yield const ErrorBldgDetailState(
            "error while getting specific building detail");
      }
    }
  }
}
