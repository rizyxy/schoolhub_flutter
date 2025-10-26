import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolhub_flutter/data/model/subject.dart';

part 'subject_event.dart';
part 'subject_state.dart';

class SubjectBloc extends Bloc<SubjectEvent, SubjectState> {
  SubjectBloc() : super(SubjectInitial()) {
    on<FetchSubjects>((event, emit) async {
      emit(SubjectLoading());

      try {
        await Future.delayed(Duration(seconds: 2));
        emit(SubjectSuccess(subjects: []));
      } catch (e) {
        emit(SubjectError(errorMessage: e.toString()));
      }
    });
  }
}
