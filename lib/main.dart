import 'package:flutter/material.dart';
import 'package:schoolhub_flutter/presentation/views/home_page.dart';

void main(List<String> args) {
  runApp(SchoolHub());
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
