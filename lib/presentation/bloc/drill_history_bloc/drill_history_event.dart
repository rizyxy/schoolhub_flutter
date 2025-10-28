part of 'drill_history_bloc.dart';

sealed class DrillHistoryEvent extends Equatable {
  const DrillHistoryEvent();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class FetchDrillHistories extends DrillHistoryEvent {}
