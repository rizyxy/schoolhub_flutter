part of 'drill_progression_bloc.dart';

sealed class DrillProgressionState extends Equatable {
  const DrillProgressionState();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class DrillProgressionLoaded extends DrillProgressionState {
  final DrillModel drill;
  final int currentQuestionIndex;

  const DrillProgressionLoaded(
      {required this.drill, this.currentQuestionIndex = 0});

  @override
  List<Object?> get props => [drill, currentQuestionIndex];
}
