part of 'drill_history_bloc.dart';

sealed class DrillHistoryState extends Equatable {
  const DrillHistoryState();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class DrillHistoryInitial extends DrillHistoryState {}

class DrillHistoryLoading extends DrillHistoryState {}

class DrillHistorySuccess extends DrillHistoryState {}

class DrillHistoryError extends DrillHistoryState {
  final String? errorMessage;

  const DrillHistoryError({this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
