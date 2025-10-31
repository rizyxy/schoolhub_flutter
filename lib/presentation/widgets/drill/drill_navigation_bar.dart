import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolhub_flutter/presentation/bloc/drill_progression_bloc/drill_progression_bloc.dart';

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
            InkWell(
              onTap: () {
                context.read<DrillProgressionBloc>().add(NextDrillQuestion());
              },
              child: Ink(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(color: Colors.blueAccent.shade700),
                child: const Text(
                  "Next",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        );
      }

      if (currentIndex == totalQuestions - 1) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkWell(
              onTap: () {
                context
                    .read<DrillProgressionBloc>()
                    .add(PreviousDrillQuestion());
              },
              child: Ink(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(color: Colors.grey.shade200),
                child: const Text(
                  "Previous",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                context
                    .read<DrillProgressionBloc>()
                    .add(FinishDrillProgression());
              },
              child: Ink(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(color: Colors.red.shade800),
                child: const Text(
                  "Finish",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        );
      }

      if (currentIndex < totalQuestions) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkWell(
              onTap: () {
                context
                    .read<DrillProgressionBloc>()
                    .add(PreviousDrillQuestion());
              },
              child: Ink(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(color: Colors.grey.shade200),
                child: const Text(
                  "Previous",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                context.read<DrillProgressionBloc>().add(NextDrillQuestion());
              },
              child: Ink(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(color: Colors.blueAccent.shade700),
                child: const Text(
                  "Next",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        );
      }

      return const SizedBox.shrink();
    });
  }
}
