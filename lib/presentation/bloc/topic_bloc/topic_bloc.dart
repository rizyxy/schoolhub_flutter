import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/retry.dart';
import 'package:schoolhub_flutter/data/model/subject.dart';
import 'package:schoolhub_flutter/data/model/topic.dart';
import 'package:schoolhub_flutter/data/repository/subject_repository.dart';

part 'topic_state.dart';
part 'topic_event.dart';

class TopicBloc extends Bloc<TopicEvent, TopicState> {
  final SubjectRepository subjectRepository = SubjectRepository();

  TopicBloc() : super(TopicInitial()) {
    on<FetchTopics>((event, emit) async {
      emit(TopicLoading());

      try {
        List<TopicModel> topics =
            await subjectRepository.fetchSubjectTopics(event.subject);

        emit(TopicSuccess(topics: topics));
      } catch (e) {
        emit(TopicError(errorMessage: e.toString()));
      }
    });
  }
}
