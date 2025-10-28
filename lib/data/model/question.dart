// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class QuestionModel {
  int id;
  String question;
  String optionA;
  String optionB;
  String optionC;
  String optionD;
  String correctAnswer;
  String? explanation;
  QuestionModel({
    required this.id,
    required this.question,
    required this.optionA,
    required this.optionB,
    required this.optionC,
    required this.optionD,
    required this.correctAnswer,
    this.explanation,
  });

  QuestionModel copyWith({
    int? id,
    String? question,
    String? optionA,
    String? optionB,
    String? optionC,
    String? optionD,
    String? correctAnswer,
    String? explanation,
  }) {
    return QuestionModel(
      id: id ?? this.id,
      question: question ?? this.question,
      optionA: optionA ?? this.optionA,
      optionB: optionB ?? this.optionB,
      optionC: optionC ?? this.optionC,
      optionD: optionD ?? this.optionD,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      explanation: explanation ?? this.explanation,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'question': question,
      'option_a': optionA,
      'option_b': optionB,
      'option_c': optionC,
      'option_d': optionD,
      'correct_answer': correctAnswer,
      'explanation': explanation,
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      id: map['id'] as int,
      question: map['question'] as String,
      optionA: map['option_a'] as String,
      optionB: map['option_b'] as String,
      optionC: map['option_c'] as String,
      optionD: map['option_d'] as String,
      correctAnswer: map['correct_answer'] as String,
      explanation:
          map['explanation'] != null ? map['explanation'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuestionModel(id: $id, question: $question, optionA: $optionA, optionB: $optionB, optionC: $optionC, optionD: $optionD, correctAnswer: $correctAnswer, explanation: $explanation)';
  }

  @override
  bool operator ==(covariant QuestionModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.question == question &&
        other.optionA == optionA &&
        other.optionB == optionB &&
        other.optionC == optionC &&
        other.optionD == optionD &&
        other.correctAnswer == correctAnswer &&
        other.explanation == explanation;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        question.hashCode ^
        optionA.hashCode ^
        optionB.hashCode ^
        optionC.hashCode ^
        optionD.hashCode ^
        correctAnswer.hashCode ^
        explanation.hashCode;
  }
}
