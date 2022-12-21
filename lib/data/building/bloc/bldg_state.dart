part of 'bldg_bloc.dart';

@immutable
abstract class BldgState extends Equatable {
  const BldgState();

  @override
  List<Object> get props => [];
}

// class BldgInitial extends BldgState {}
class InitialBldgState extends BldgState {}

class BldgLoadingState extends BldgState {}

class AllBldgLoadedState extends BldgState {
  List<Building> fetchedbldgs;
  AllBldgLoadedState(this.fetchedbldgs);

  @override
  List<Object> get props => [fetchedbldgs];
}

class ErrorBldgState extends BldgState {
  final String message;
  const ErrorBldgState(this.message);
}
