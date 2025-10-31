import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:schoolhub_flutter/presentation/bloc/subject_bloc/subject_bloc.dart';
import 'package:schoolhub_flutter/presentation/views/home_page.dart';

void main(List<String> args) async {
  await dotenv.load(fileName: '.env');

  runApp(MultiBlocProvider(providers: [
    BlocProvider<SubjectBloc>(
        create: (context) => SubjectBloc()..add(FetchSubjects()))
  ], child: const SchoolHub()));
}

class SchoolHub extends StatelessWidget {
  const SchoolHub({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
