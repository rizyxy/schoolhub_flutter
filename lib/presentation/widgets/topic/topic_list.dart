import 'package:flutter/material.dart';
import 'package:schoolhub_flutter/data/model/topic.dart';
import 'package:schoolhub_flutter/presentation/views/topic_page.dart';
import 'package:schoolhub_flutter/presentation/widgets/shared/item_card.dart';

class TopicList extends StatelessWidget {
  const TopicList({super.key, required this.topics});

  final List<TopicModel> topics;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TopicPage(
                              topic: topics[index],
                            )));
              },
              child: ItemCard(itemName: topics[index].name));
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 20,
          );
        },
        itemCount: 10);
  }
}
