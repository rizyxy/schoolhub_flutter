// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:schoolhub_flutter/data/model/drill_question.dart';

class DrillModel {
  int id;
  String status;
  List<DrillQuestionModel> drillQuestions;
  DrillModel({
    required this.id,
    required this.status,
    required this.drillQuestions,
  });

  DrillModel copyWith({
    int? id,
    String? status,
    List<DrillQuestionModel>? drillQuestions,
  }) {
    return DrillModel(
      id: id ?? this.id,
      status: status ?? this.status,
      drillQuestions: drillQuestions ?? this.drillQuestions,
    );
  }

  factory DrillModel.fromMap(Map<String, dynamic> map) {
    return DrillModel(
      id: map['id'] as int,
      status: map['status'] as String,
      drillQuestions: List<DrillQuestionModel>.from(
        (map['drillQuestions']).map<DrillQuestionModel>(
          (x) => DrillQuestionModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory DrillModel.fromJson(String source) =>
      DrillModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'DrillModel(id: $id, status: $status, drillQuestions: $drillQuestions)';

  @override
  bool operator ==(covariant DrillModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.status == status &&
        listEquals(other.drillQuestions, drillQuestions);
  }

  @override
  int get hashCode => id.hashCode ^ status.hashCode ^ drillQuestions.hashCode;
}
