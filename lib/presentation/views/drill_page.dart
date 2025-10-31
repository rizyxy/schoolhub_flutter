import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolhub_flutter/data/model/drill.dart';
import 'package:schoolhub_flutter/data/model/drill_question.dart';
import 'package:schoolhub_flutter/data/model/topic.dart';
import 'package:schoolhub_flutter/presentation/bloc/drill_progression_bloc/drill_progression_bloc.dart';
import 'package:schoolhub_flutter/presentation/views/topic_page.dart';
import 'package:schoolhub_flutter/presentation/widgets/drill/drill_answer_list.dart';
import 'package:schoolhub_flutter/presentation/widgets/drill/drill_navigation_bar.dart';
import 'package:schoolhub_flutter/presentation/widgets/drill/drill_progress_indicator.dart';

class DrillPage extends StatelessWidget {
  const DrillPage({super.key, required this.topic});

  final TopicModel topic;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrillProgressionBloc, DrillProgressionState>(
      listener: (context, state) {
        if (state is DrillProgressionFinished) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => TopicPage(topic: topic)));
        }
      },
      builder: (context, state) {
        if (state is DrillProgressionLoading ||
            state is DrillProgressionFinished) {
          return const Scaffold(
            body: SafeArea(
                child: Center(
              child: CircularProgressIndicator(),
            )),
          );
        }

        DrillProgressionLoaded currentState = state as DrillProgressionLoaded;

        DrillModel currentDrill = currentState.drill;
        DrillQuestionModel currentDrillQuestion =
            currentDrill.drillQuestions[state.currentQuestionIndex];

        return Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(30),
            child: DrillNavigationBar(
              currentIndex: currentState.currentQuestionIndex,
              totalQuestions: currentDrill.drillQuestions.length,
            ),
          ),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  DrillProgressIndicator(
                    currentIndex: currentState.currentQuestionIndex + 1,
                    totalQuestions: currentState.drill.drillQuestions.length,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(currentDrillQuestion.question.question),
                  const SizedBox(
                    height: 20,
                  ),
                  DrillAnswerList(
                    answerList: [
                      {
                        'answer': currentDrillQuestion.question.optionA,
                        'label': 'a'
                      },
                      {
                        'answer': currentDrillQuestion.question.optionB,
                        'label': 'b'
                      },
                      {
                        'answer': currentDrillQuestion.question.optionC,
                        'label': 'c'
                      },
                      {
                        'answer': currentDrillQuestion.question.optionD,
                        'label': 'd'
                      },
                    ],
                    selectedAnswer: currentDrillQuestion.answer,
                  )
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}
