import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolhub_flutter/presentation/bloc/topic_bloc/topic_bloc.dart';
import 'package:schoolhub_flutter/presentation/widgets/shared/item_card.dart';

class TopicBlocConsumer extends StatelessWidget {
  const TopicBlocConsumer({
    super.key,
  });

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
          return Center(
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
                    context.read<TopicBloc>().add(FetchTopics());
                  },
                  child: Icon(Icons.restart_alt)),
              Text("Tap to Retry")
            ],
          );
        }

        if (state is TopicSuccess) {
          return ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ItemCard(itemName: "Topic ${index}");
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 20,
                );
              },
              itemCount: 10);
        }

        return SizedBox.shrink();
      },
    );
  }
}
