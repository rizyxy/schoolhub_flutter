import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolhub_flutter/data/model/topic.dart';
import 'package:schoolhub_flutter/presentation/bloc/drill_bloc/drill_bloc.dart';
import 'package:schoolhub_flutter/presentation/widgets/drill/drill_list.dart';

class DrillBlocConsumer extends StatelessWidget {
  const DrillBlocConsumer({super.key, required this.topic});

  final TopicModel topic;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrillBloc, DrillState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is DrillLoading) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is DrillError) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              InkWell(
                  onTap: () {
                    context.read<DrillBloc>().add(FetchDrills());
                  },
                  child: Icon(Icons.restart_alt)),
              Text("Tap to Retry")
            ],
          );
        }

        if (state is DrillSuccess) {
          return DrillList(
            topic: topic,
            drills: state.drills,
          );
        }

        return SizedBox.shrink();
      },
    );
  }
}
