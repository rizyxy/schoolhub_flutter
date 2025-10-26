import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolhub_flutter/presentation/bloc/subject_bloc/subject_bloc.dart';
import 'package:schoolhub_flutter/presentation/widgets/subject/subject_bloc_consumer.dart';
import 'package:schoolhub_flutter/presentation/widgets/subject/subject_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                "All Subjects",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              SubjectBlocConsumer()
            ],
          ),
        ),
      )),
    );
  }
}
