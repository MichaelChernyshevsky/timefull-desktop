import 'dart:convert';

import 'package:timefullcore/packages/note/models/note_model/model.dart';

class NoteWidgetController {
  String? savedText;
  String? priviusPhysicalKey;
  int? deleteHelper;
  bool? focused;
  NoteModel? note;

  NoteWidgetController({
    this.savedText,
    this.deleteHelper,
    this.focused,
    this.priviusPhysicalKey,
    this.note,
  });

  NoteWidgetController copyWith({
    String? savedText,
    int? deleteHelper,
    bool? focused,
    NoteModel? note,
    String? priviusPhysicalKey,
  }) {
    return NoteWidgetController(
      savedText: savedText ?? this.savedText,
      deleteHelper: deleteHelper ?? this.deleteHelper,
      focused: focused ?? this.focused,
      priviusPhysicalKey: priviusPhysicalKey ?? this.priviusPhysicalKey,
      note: note ?? this.note,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'savedText': savedText,
      'deleteHelper': deleteHelper,
      'focused': focused,
    };
  }

  String toJson() => json.encode(toMap());
}
