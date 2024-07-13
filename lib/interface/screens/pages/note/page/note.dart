// // ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:timefull/exports.dart';
import 'package:timefull/interface/screens/pages/note/page/model.dart';
import 'package:timefullcore/packages/note/models/note_model/model.dart';

import 'package:flutter/material.dart';

class NoteWidget extends StatefulWidget {
  final NoteModel note;
  final Function(KeyEvent) handleKeyBoard;
  final Function(String) onChangeText;

  final FocusNode focusNode;
  final VoidCallback editMode;

  const NoteWidget({
    super.key,
    required this.note,
    required this.handleKeyBoard,
    required this.focusNode,
    required this.editMode,
    required this.onChangeText,
  });

  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  NoteWidgetController widgetController = NoteWidgetController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 12),
          child: suffics,
        ),
        GestureDetector(
          onTap: widget.editMode,
          child: const Icon(Icons.workspaces),
        ),
        const SizedBox(
          width: 40,
        ),
        SizedBox(
          width: 300,
          child: Padding(
            padding: EdgeInsets.only(left: 40 * (widget.note.padding ?? 0).toDouble()),
            child: KeyboardListener(
              focusNode: widget.focusNode,
              onKeyEvent: widget.handleKeyBoard,
              child: TextFormField(
                controller: TextEditingController(text: widget.note.text),
                maxLines: null,
                decoration: const InputDecoration(border: InputBorder.none),
                onChanged: widget.onChangeText,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget? get suffics {
    if (widget.note.suffics != null) {
      switch (widget.note.suffics!) {
        case 'empty':
          return const Text('');
        case 'mark':
          return const Icon(Icons.check_box_outlined);
        case 'point':
          return const Text('·');
        case 'tire':
          return const Text('-');
      }
    }
    return null;
  }
}
