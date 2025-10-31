import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolhub_flutter/data/model/subject.dart';
import 'package:schoolhub_flutter/presentation/bloc/topic_bloc/topic_bloc.dart';
import 'package:schoolhub_flutter/presentation/widgets/topic/topic_list.dart';

class TopicBlocConsumer extends StatelessWidget {
  const TopicBlocConsumer({super.key, required this.subject});

  final SubjectModel subject;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TopicBloc, TopicState>(
      listener: (context, state) {
        if (state is TopicError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errorMessage ?? "An error has occured")));
        }
      },
      builder: (context, state) {
        if (state is TopicLoading) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is TopicError) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              InkWell(
                  onTap: () {
                    context
                        .read<TopicBloc>()
                        .add(FetchTopics(subject: subject));
                  },
                  child: const Icon(Icons.restart_alt)),
              const Text("Tap to Retry")
            ],
          );
        }

        if (state is TopicSuccess) {
          return TopicList(
            topics: state.topics,
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
