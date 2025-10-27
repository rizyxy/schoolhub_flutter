// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TopicModel {
  int id;
  String name;
  String grade;
  TopicModel({
    required this.id,
    required this.name,
    required this.grade,
  });

  TopicModel copyWith({
    int? id,
    String? name,
    String? grade,
  }) {
    return TopicModel(
      id: id ?? this.id,
      name: name ?? this.name,
      grade: grade ?? this.grade,
    );
  }

  factory TopicModel.fromMap(Map<String, dynamic> map) {
    return TopicModel(
      id: map['id'] as int,
      name: map['name'] as String,
      grade: map['grade'] as String,
    );
  }

  factory TopicModel.fromJson(String source) =>
      TopicModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TopicModel(id: $id, name: $name, grade: $grade)';

  @override
  bool operator ==(covariant TopicModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.grade == grade;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ grade.hashCode;
}
