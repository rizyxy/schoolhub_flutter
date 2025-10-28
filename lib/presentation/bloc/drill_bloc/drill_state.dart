part of 'drill_bloc.dart';

sealed class DrillState extends Equatable {
  const DrillState();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class DrillInitial extends DrillState {}

class DrillLoading extends DrillState {}

class DrillSuccess extends DrillState {
  final List<DrillModel> drills;

  const DrillSuccess({required this.drills});

  @override
  List<Object?> get props => [drills];
}

class DrillError extends DrillState {
  final String? errorMessage;

  const DrillError({this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
