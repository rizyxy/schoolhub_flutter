part of 'drill_progression_bloc.dart';

class DrillProgressionEvent extends Equatable {
  const DrillProgressionEvent();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class NextDrillQuestion extends DrillProgressionEvent {}

class PreviousDrillQuestion extends DrillProgressionEvent {}

class AnswerDrillQuestion extends DrillProgressionEvent {
  final String answer;

  const AnswerDrillQuestion({required this.answer});

  @override
  List<Object?> get props => [answer];
}
