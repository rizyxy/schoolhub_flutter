import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:schoolhub_flutter/data/model/drill.dart';
import 'package:http/http.dart' as http;

class DrillRepository {
  final String baseUrl = "${dotenv.get('SERVER_URL')}/drills";

  Future<List<DrillModel>> fetchDrills({required String status}) async {
    final Uri uri = Uri.parse("$baseUrl?status=$status");

    final response = await http.get(uri);
    final decodedResponse = json.decode(response.body);

    final List<DrillModel> drills = (decodedResponse as List)
        .map((map) => DrillModel.fromMap(map))
        .toList();

    return drills;
  }
}
