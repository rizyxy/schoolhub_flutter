// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SubjectModel {
  int id;
  String name;
  SubjectModel({
    required this.id,
    required this.name,
  });

  SubjectModel copyWith({
    int? id,
    String? name,
  }) {
    return SubjectModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  factory SubjectModel.fromMap(Map<String, dynamic> map) {
    return SubjectModel(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  factory SubjectModel.fromJson(String source) =>
      SubjectModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SubjectModel(id: $id, name: $name)';

  @override
  bool operator ==(covariant SubjectModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
