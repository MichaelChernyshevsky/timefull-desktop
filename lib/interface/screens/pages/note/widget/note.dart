// ignore_for_file: public_member_api_docs, sort_constructors_first

part of '../screen.dart';

class NoteWidgetController {
  String? savedText;
  int? deleteHelper;
  bool? focused;

  NoteWidgetController({
    this.savedText,
    this.deleteHelper,
    this.focused,
  });

  NoteWidgetController copyWith({
    String? savedText,
    int? deleteHelper,
    bool? focused,
  }) {
    return NoteWidgetController(
      savedText: savedText ?? this.savedText,
      deleteHelper: deleteHelper ?? this.deleteHelper,
      focused: focused ?? this.focused,
    );
  }

  NoteWidgetController updateDelete() {
    return NoteWidgetController(
      savedText: savedText,
      deleteHelper: deleteHelper != null ? deleteHelper! + 1 : 1,
      focused: focused,
    );
  }
}

class NoteWidget extends StatefulWidget {
  NoteWidget({super.key, required this.note});

  late NoteModel note;

  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  late String _text;

  late NoteBloc _noteBloc;
  final FocusNode _focusNode = FocusNode();

  NoteWidgetController widgetController = NoteWidgetController();

  @override
  void initState() {
    _text = widget.note.text;
    _noteBloc = BlocProvider.of<NoteBloc>(context);
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        widgetController = widgetController.copyWith(focused: true);
      } else {
        if (widgetController.focused == true) {
          if (widgetController.savedText != null) {
            _noteBloc.add(EditNote(model: widget.note.copyWith(text: widgetController.savedText!)));
          }
        }
      }
    });
  }

  void _updateText(String newText) => widgetController = widgetController.copyWith(savedText: newText);

  String priviusPhysicalKey = '';

  void handleEnterPress(KeyEvent event) {
    if (priviusPhysicalKey != event.physicalKey.debugName) {
      if (event.physicalKey.debugName == 'Tab') {
        debugPrint('Tab key pressed!');
      } else {
        priviusPhysicalKey = event.physicalKey.debugName.toString();
      }
    } else {
      priviusPhysicalKey = '';
      if (event.physicalKey.debugName == 'Enter') {
        debugPrint('Enter key pressed!');
      } else if (event.physicalKey.debugName == 'Backspace') {
        if (widgetController.savedText != null && widgetController.savedText!.isEmpty) {
          widgetController = widgetController.updateDelete();
          if (widgetController.deleteHelper == 2) {
            _noteBloc.add(DeleteNote(id: widget.note.id));
          }
        } else {
          widgetController = widgetController.copyWith(deleteHelper: 0);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 12),
          child: suffics,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => _noteBloc.add(EditMode(key: widget.key as GlobalKey, note: widget.note)),
                child: const Icon(Icons.workspaces),
              ),
              const SizedBox(
                width: 40,
              ),
              Expanded(
                child: KeyboardListener(
                  focusNode: _focusNode,
                  onKeyEvent: handleEnterPress,
                  child: TextFormField(
                    controller: TextEditingController(text: _text),
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    onChanged: _updateText,
                    // focusNode: _focusNode,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget? get suffics {
    if (widget.note.suffics != null) {
      switch (widget.note.suffics!) {
        case NoteSuffics.empty:
          return const Text('');
        case NoteSuffics.mark:
          return const Icon(Icons.check_box_outlined);
        case NoteSuffics.point:
          return const Text('·');
        case NoteSuffics.tire:
          return const Text('-');
      }
    }
    return null;
  }
}
