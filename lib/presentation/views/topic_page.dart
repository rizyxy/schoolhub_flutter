import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolhub_flutter/data/model/topic.dart';
import 'package:schoolhub_flutter/presentation/bloc/drill_bloc/drill_bloc.dart';
import 'package:schoolhub_flutter/presentation/widgets/drill/drill_bloc_consumer.dart';
import 'package:schoolhub_flutter/presentation/widgets/drill/drill_list.dart';

class TopicPage extends StatelessWidget {
  const TopicPage({super.key, required this.topic});

  final TopicModel topic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              topic.name,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Ongoing Drills",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            BlocProvider(
                create: (context) => DrillBloc()..add(FetchDrills()),
                child: DrillBlocConsumer())
          ],
        ),
      )),
    );
  }
}
