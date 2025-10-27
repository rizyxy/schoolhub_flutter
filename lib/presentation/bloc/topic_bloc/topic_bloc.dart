import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'topic_state.dart';
part 'topic_event.dart';

class TopicBloc extends Bloc<TopicEvent, TopicState> {
  TopicBloc() : super(TopicInitial()) {
    on<FetchTopics>((event, emit) async {
      emit(TopicLoading());

      try {
        await Future.delayed(Duration(seconds: 2));

        emit(TopicSuccess());
      } catch (e) {
        emit(TopicError(errorMessage: e.toString()));
      }
    });
  }
}
