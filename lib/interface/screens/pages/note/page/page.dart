import 'package:flutter/material.dart';
import 'package:timefull/exports.dart';
import 'package:timefull/interface/screens/pages/note/page/model.dart';
import 'package:timefull/interface/screens/pages/note/page/note.dart';
import 'package:timefull/manager/packages/note/childBloc/bloc.dart';
import 'package:timefullcore/packages/note/models/note_model/model.dart';

class PageWidget extends StatefulWidget {
  const PageWidget({super.key});

  @override
  State<PageWidget> createState() => _PageWidgetState();
}

class _PageWidgetState extends State<PageWidget> {
  late PageBloc _pageBloc;

  NoteWidgetController controllerWidget = NoteWidgetController();
  final FocusNode _titleFocusNode = FocusNode();

  NoteWidgetController controllerNote = NoteWidgetController();
  final FocusNode _noteFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _pageBloc = BlocProvider.of<PageBloc>(context);

    _noteFocusNode.addListener(_onNoteFocusChange);
    _titleFocusNode.addListener(_onTitleFocusChange);
  }

  void _onNoteFocusChange() {
    //  if (_noteFocusNode.hasFocus) {
    //     // controllerWidget = controllerWidget.copyWith(focused: true);
    //   } else {
    //     if (controllerWidget.focused == true) {
    //       if (controllerWidget.savedText != null) {
    //         controllerWidget = NoteWidgetController();
    //       }
    //     }
    //   }
  }

  void _onTitleFocusChange() => _titleFocusNode.hasFocus == false
      ? _pageBloc.add(
          EditTitleChild(title: controllerWidget.savedText),
        )
      : null;

  void _updateTitle(String newText) => controllerWidget = controllerWidget.copyWith(savedText: newText);

  void _editMode(NoteModel note) {
//  _pageBloc.add(EditMode(key: widget.key as GlobalKey, note: widget.note));
  }

  void _onChangeText(String newText) => controllerNote.savedText = newText;

  void _handleKeyBoard(KeyEvent event, NoteModel note) {
    void delete() {
      if ((note.padding != null && note.padding! > 0)) {
        _pageBloc.add(EditNoteChild(model: note.copyWith(padding: note.padding! - 1, text: (controllerNote.savedText))));
      } else if (note.suffics != null && note.suffics != 'empty') {
        _pageBloc.add(EditNoteChild(model: note.copyWith(suffics: 'empty', text: controllerNote.savedText)));
      } else {
        _pageBloc.add(DeleteNoteChild(id: note.id));
      }
    }

    if (controllerNote.priviusPhysicalKey != event.physicalKey.debugName) {
      if (event.physicalKey.debugName == 'Tab') {
        setState(() => _noteFocusNode.requestFocus());
        _pageBloc.add(EditNoteChild(model: note.copyWith(padding: (note.padding ?? 0) + 1, text: controllerNote.savedText)));
      } else {
        controllerNote = controllerNote.copyWith(priviusPhysicalKey: event.physicalKey.debugName.toString());
      }
    } else {
      if (event.physicalKey.debugName == 'Enter') {
        _pageBloc.add(EditNoteChild(model: note.copyWith(text: controllerNote.savedText)));
        _pageBloc.add(AddNoteChild(note));
      } else if (event.physicalKey.debugName == 'Backspace') {
        if (controllerNote.savedText != null && controllerNote.savedText!.isEmpty) {
          controllerNote = controllerNote.copyWith(deleteHelper: (controllerNote.deleteHelper ?? 0) + 1);
          delete();
        } else if (controllerNote.savedText == null) {
          delete();
        } else {
          controllerNote = controllerNote.copyWith(deleteHelper: 0);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageBloc, PageBlocState>(
      builder: (context, state) {
        return Column(
          children: [
            Text(state.page!.page.title),
            TextFormField(
              controller: TextEditingController(text: state.page!.page.title),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              maxLines: 1,
              decoration: const InputDecoration(border: InputBorder.none),
              onChanged: _updateTitle,
              focusNode: _titleFocusNode,
            ),
            Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: state.page!.notes.map((note) {
                      if (note.active != false) {
                        return NoteWidget(
                          key: GlobalKey(debugLabel: note.id.toString()),
                          note: note,
                          editMode: () => _editMode(note),
                          handleKeyBoard: (event) => _handleKeyBoard(event, note),
                          focusNode: _noteFocusNode,
                          onChangeText: _onChangeText,
                        );
                      } else {
                        return const Text('');
                      }
                    }).toList(),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
