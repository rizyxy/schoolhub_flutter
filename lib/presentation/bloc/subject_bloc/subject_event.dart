part of 'subject_bloc.dart';

sealed class SubjectEvent extends Equatable {
  const SubjectEvent();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class FetchSubjects extends SubjectEvent {}
