// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class todoModel {
  String name;
  dynamic createdAt;
  todoModel({
    required this.name,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory todoModel.fromMap(Map<String, dynamic> map) {
    return todoModel(
      name: map['name'] as String,
      createdAt: map["created_at"],
    );
  }

  String toJson() => json.encode(toMap());

  factory todoModel.fromJson(String source) =>
      todoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'todoModel(name: $name, createdAt: $createdAt)';
}
