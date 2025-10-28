import 'package:flutter/material.dart';

class DrillAnswerList extends StatelessWidget {
  const DrillAnswerList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) {
        return Ink(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(color: Colors.grey.shade200),
          child: Text("Option $index"),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 20,
        );
      },
    );
  }
}
