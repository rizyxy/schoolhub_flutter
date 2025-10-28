import 'package:flutter/material.dart';

class DrillProgressIndicator extends StatelessWidget {
  const DrillProgressIndicator(
      {super.key, required this.currentIndex, required this.totalQuestions});

  final int currentIndex;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: LinearProgressIndicator(
            value: currentIndex / totalQuestions,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          "$currentIndex/$totalQuestions",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
