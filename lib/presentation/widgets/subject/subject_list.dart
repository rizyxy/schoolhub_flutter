import 'package:flutter/material.dart';

class SubjectList extends StatelessWidget {
  const SubjectList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Ink(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10)),
            child: Text("Topic $index",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20));
  }
}
