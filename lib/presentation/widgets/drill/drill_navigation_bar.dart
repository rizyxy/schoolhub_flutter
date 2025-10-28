import 'package:flutter/material.dart';

class DrillNavigationBar extends StatelessWidget {
  const DrillNavigationBar(
      {super.key, required this.currentIndex, required this.totalQuestions});

  final int currentIndex;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (currentIndex == 0) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Ink(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(color: Colors.blueAccent.shade700),
              child: Text(
                "Next",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        );
      }

      if (currentIndex < totalQuestions) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Ink(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(color: Colors.grey.shade200),
              child: Text(
                "Previous",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Ink(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(color: Colors.blueAccent.shade700),
              child: Text(
                "Next",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      }

      if (currentIndex == totalQuestions) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Ink(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(color: Colors.grey.shade200),
              child: Text(
                "Previous",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Ink(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(color: Colors.red.shade800),
              child: Text(
                "Finish",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      }

      return SizedBox.shrink();
    });
  }
}
