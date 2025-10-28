part of 'drill_bloc.dart';

sealed class DrillEvent extends Equatable {
  const DrillEvent();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class FetchDrills extends DrillEvent {}
