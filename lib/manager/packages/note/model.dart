// ignore_for_file: public_member_api_docs, sort_constructors_first
enum NoteSuffics {
  mark,
  point,
  tire,
  empty,
}

class NoteModel {
  final int id;
  final String text;
  final NoteSuffics? suffics;
  final bool? active;
  final int? padding;
  final bool? markActive;

  NoteModel({
    required this.id,
    required this.text,
    required this.suffics,
    this.active,
    this.padding,
    this.markActive,
  });

  NoteModel copyWith({
    int? id,
    String? text,
    NoteSuffics? suffics,
    bool? active,
    int? padding,
    bool? markActive,
  }) {
    return NoteModel(
      id: id ?? this.id,
      text: text ?? this.text,
      suffics: suffics ?? this.suffics,
      active: active ?? this.active,
      padding: padding ?? this.padding,
      markActive: markActive ?? this.markActive,
    );
  }
}
