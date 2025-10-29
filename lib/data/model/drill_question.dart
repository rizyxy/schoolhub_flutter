// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:schoolhub_flutter/data/model/question.dart';

class DrillQuestionModel {
  final int id;
  final String? answer;
  final QuestionModel question;
  DrillQuestionModel({
    required this.id,
    this.answer,
    required this.question,
  });

  DrillQuestionModel copyWith({
    int? id,
    String? answer,
    QuestionModel? question,
  }) {
    return DrillQuestionModel(
      id: id ?? this.id,
      answer: answer ?? this.answer,
      question: question ?? this.question,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'answer': answer,
      'question': question.toMap(),
    };
  }

  factory DrillQuestionModel.fromMap(Map<String, dynamic> map) {
    return DrillQuestionModel(
      id: map['id'] as int,
      answer: map['answer'] != null ? map['answer'] as String : null,
      question: QuestionModel.fromMap(map['question'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory DrillQuestionModel.fromJson(String source) =>
      DrillQuestionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'DrillQuestionModel(id: $id, answer: $answer, question: $question)';

  @override
  bool operator ==(covariant DrillQuestionModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.answer == answer &&
        other.question == question;
  }

  @override
  int get hashCode => id.hashCode ^ answer.hashCode ^ question.hashCode;
}
