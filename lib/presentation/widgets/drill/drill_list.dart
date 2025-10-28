import 'package:flutter/material.dart';
import 'package:schoolhub_flutter/presentation/widgets/shared/item_card.dart';

class DrillList extends StatelessWidget {
  const DrillList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return ItemCard(itemName: "Drill $index");
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 20,
        );
      },
    );
  }
}
