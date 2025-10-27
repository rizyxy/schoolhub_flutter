import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolhub_flutter/data/model/subject.dart';
import 'package:schoolhub_flutter/presentation/widgets/topic/topic_bloc_consumer.dart';

class SubjectPage extends StatelessWidget {
  const SubjectPage({super.key, required this.subject});

  final SubjectModel subject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                subject.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              TopicBlocConsumer(
                subject: subject,
              )
            ],
          ),
        ),
      )),
    );
  }
}
