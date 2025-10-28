import 'package:flutter/material.dart';
import 'package:schoolhub_flutter/data/model/drill.dart';
import 'package:schoolhub_flutter/presentation/widgets/shared/item_card.dart';

class DrillList extends StatelessWidget {
  const DrillList({super.key, required this.drills});

  final List<DrillModel> drills;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: drills.length,
      itemBuilder: (context, index) {
        return ItemCard(itemName: "Drill ${drills[index].id}");
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 20,
        );
      },
    );
  }
}
