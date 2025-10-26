import 'package:flutter/material.dart';
import 'package:schoolhub_flutter/data/model/subject.dart';

class SubjectList extends StatelessWidget {
  const SubjectList({super.key, required this.subjects});

  final List<SubjectModel> subjects;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          return Ink(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10)),
            child: Text(subjects[index].name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20));
  }
}
