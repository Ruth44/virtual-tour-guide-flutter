part of 'bldg_detail_bloc.dart';

@immutable
abstract class BldgDetailState extends Equatable {
  const BldgDetailState();

  @override
  List<Object> get props => [];
}

class BldgDetailInitial extends BldgDetailState {}

class BldgDetailLoadingState extends BldgDetailState {}

class BldgDetailsLoadedState extends BldgDetailState {
  BldgDetail fetchedBldgDetails;
  BldgDetailsLoadedState(this.fetchedBldgDetails);

  @override
  List<Object> get props => [fetchedBldgDetails];
}

class ErrorBldgDetailState extends BldgDetailState {
  final String message;
  const ErrorBldgDetailState(this.message);
}
