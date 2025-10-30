part of 'drill_progression_bloc.dart';

sealed class DrillProgressionState extends Equatable {
  const DrillProgressionState();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class DrillProgressionLoaded extends DrillProgressionState {
  final DrillModel drill;
  final int currentQuestionIndex;
  final String? errorMessage;

  const DrillProgressionLoaded(
      {required this.drill, this.currentQuestionIndex = 0, this.errorMessage});

  @override
  List<Object?> get props => [drill, currentQuestionIndex, errorMessage];
}

class DrillProgressionLoading extends DrillProgressionState {}

class DrillProgressionFinished extends DrillProgressionState {}
