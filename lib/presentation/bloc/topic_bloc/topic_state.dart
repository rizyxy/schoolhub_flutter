part of 'topic_bloc.dart';

sealed class TopicState extends Equatable {
  const TopicState();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class TopicInitial extends TopicState {}

class TopicLoading extends TopicState {}

class TopicSuccess extends TopicState {
  final List<TopicModel> topics;

  const TopicSuccess({required this.topics});

  @override
  List<Object?> get props => [topics];
}

class TopicError extends TopicState {
  final String? errorMessage;

  const TopicError({this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
