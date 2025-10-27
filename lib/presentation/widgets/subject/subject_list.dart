import 'package:flutter/material.dart';
import 'package:schoolhub_flutter/data/model/subject.dart';
import 'package:schoolhub_flutter/presentation/views/subject_page.dart';
import 'package:schoolhub_flutter/presentation/widgets/shared/item_card.dart';

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
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SubjectPage(subject: subjects[index])));
            },
            child: ItemCard(
              itemName: subjects[index].name,
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20));
  }
}
