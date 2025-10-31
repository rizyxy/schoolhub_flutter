import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolhub_flutter/presentation/bloc/drill_progression_bloc/drill_progression_bloc.dart';

class DrillAnswerList extends StatelessWidget {
  const DrillAnswerList(
      {super.key, required this.answerList, this.selectedAnswer});

  final List<Map<String, String>> answerList;
  final String? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            context
                .read<DrillProgressionBloc>()
                .add(AnswerDrillQuestion(answer: answerList[index]['label']!));
          },
          child: Ink(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: answerList[index]['label'] == selectedAnswer
                    ? Colors.blueAccent.shade700
                    : Colors.grey.shade200),
            child: Text(answerList[index]['answer']!),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 20,
        );
      },
    );
  }
}
