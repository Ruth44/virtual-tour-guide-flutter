part of 'bldg_detail_bloc.dart';

@immutable
abstract class BldgDetailEvent extends Equatable {
  const BldgDetailEvent();

  @override
  List<Object> get props => [];
}

class GetBuildingDetails extends BldgDetailEvent {
  final String id;
  const GetBuildingDetails({required this.id});

  @override
  List<Object> get props => [id];
}
