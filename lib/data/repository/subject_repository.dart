import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:schoolhub_flutter/data/model/subject.dart';
import 'package:http/http.dart' as http;

class SubjectRepository {
  final String baseUrl = "${dotenv.get('SERVER_URL')}/subjects";

  Future<List<SubjectModel>> fetchSubjects() async {
    final Uri uri = Uri.parse(baseUrl);

    final response = await http.get(uri);
    final decodedResponse = json.decode(response.body);

    final List<SubjectModel> subjects = (decodedResponse as List)
        .map((map) => SubjectModel.fromMap(map))
        .toList();

    return subjects;
  }
}
