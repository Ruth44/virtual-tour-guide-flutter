part of 'bldg_bloc.dart';

@immutable
abstract class BldgEvent extends Equatable {
  const BldgEvent();

  @override
  List<Object> get props => [];
}

@immutable
class GetBuildings extends BldgEvent {
  const GetBuildings();

  @override
  List<Object> get props => [];
}
