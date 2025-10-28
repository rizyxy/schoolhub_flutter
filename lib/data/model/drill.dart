// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:schoolhub_flutter/data/model/drill_question.dart';

class DrillModel {
  int id;
  String status;
  List<DrillQuestionModel>? drillQuestions;
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'status': status,
      'drill_questions': drillQuestions?.map((x) => x.toMap()).toList(),
    };
  }

  factory DrillModel.fromMap(Map<String, dynamic> map) {
    return DrillModel(
      id: map['id'] as int,
      status: map['status'] as String,
      drillQuestions: map['drill_questions'] != null
          ? List<DrillQuestionModel>.from(
              (map['drill_questions']).map<DrillQuestionModel?>(
                (x) => DrillQuestionModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

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
