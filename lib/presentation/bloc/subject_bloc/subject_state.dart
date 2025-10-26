part of 'subject_bloc.dart';

sealed class SubjectState extends Equatable {
  const SubjectState();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class SubjectInitial extends SubjectState {}

class SubjectLoading extends SubjectState {}

class SubjectSuccess extends SubjectState {
  final List<SubjectModel> subjects;

  const SubjectSuccess({required this.subjects});

  @override
  List<Object?> get props => [subjects];
}

class SubjectError extends SubjectState {
  final String? errorMessage;

  const SubjectError({this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
