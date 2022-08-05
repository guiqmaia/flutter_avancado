import 'dart:convert';

class NoteModel {
  String title;
  String? description;
  bool? isConcluded;
  NoteModel({
    required this.title,
    this.description,
    this.isConcluded = false,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    if (description != null) {
      result.addAll({'description': description});
    }

    return result;
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      title: map['title'] ?? '',
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteModel.fromJson(String source) =>
      NoteModel.fromMap(json.decode(source));
}
