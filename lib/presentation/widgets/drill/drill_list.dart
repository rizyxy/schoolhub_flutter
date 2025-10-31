import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolhub_flutter/data/model/drill.dart';
import 'package:schoolhub_flutter/data/model/topic.dart';
import 'package:schoolhub_flutter/presentation/bloc/drill_progression_bloc/drill_progression_bloc.dart';
import 'package:schoolhub_flutter/presentation/views/drill_page.dart';
import 'package:schoolhub_flutter/presentation/widgets/shared/item_card.dart';

class DrillList extends StatelessWidget {
  const DrillList({super.key, required this.topic, required this.drills});

  final List<DrillModel> drills;
  final TopicModel topic;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: drills.length,
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlocProvider(
                          create: (context) =>
                              DrillProgressionBloc(drill: drills[index]),
                          child: DrillPage(
                            topic: topic,
                          ))));
            },
            child: ItemCard(itemName: "Drill ${drills[index].id}"));
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 20,
        );
      },
    );
  }
}
