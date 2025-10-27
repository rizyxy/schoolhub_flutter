part of 'topic_bloc.dart';

sealed class TopicEvent extends Equatable {
  const TopicEvent();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class FetchTopics extends TopicEvent {}
