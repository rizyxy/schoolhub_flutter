part of 'drill_history_bloc.dart';

sealed class DrillHistoryState extends Equatable {
  const DrillHistoryState();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class DrillHistoryInitial extends DrillHistoryState {}

class DrillHistoryLoading extends DrillHistoryState {}

class DrillHistorySuccess extends DrillHistoryState {
  final List<DrillModel> drills;

  const DrillHistorySuccess({required this.drills});

  @override
  List<Object?> get props => [drills];
}

class DrillHistoryError extends DrillHistoryState {
  final String? errorMessage;

  const DrillHistoryError({this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
