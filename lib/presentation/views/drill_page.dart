import 'package:flutter/material.dart';
import 'package:schoolhub_flutter/presentation/widgets/drill/drill_answer_list.dart';
import 'package:schoolhub_flutter/presentation/widgets/drill/drill_navigation_bar.dart';
import 'package:schoolhub_flutter/presentation/widgets/drill/drill_progress_indicator.dart';

class DrillPage extends StatelessWidget {
  const DrillPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30),
        child: DrillNavigationBar(
          currentIndex: 5,
          totalQuestions: 5,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              DrillProgressIndicator(
                currentIndex: 2,
                totalQuestions: 5,
              ),
              SizedBox(
                height: 20,
              ),
              Text("Drill Questions"),
              SizedBox(
                height: 20,
              ),
              DrillAnswerList()
            ],
          ),
        ),
      )),
    );
  }
}
