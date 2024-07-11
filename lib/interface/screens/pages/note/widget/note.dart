// // ignore_for_file: public_member_api_docs, sort_constructors_first

// part of '../screen.dart';

// class NoteWidgetController {
//   String? savedText;
//   String? priviusPhysicalKey;
//   int? deleteHelper;
//   bool? focused;

//   NoteWidgetController({
//     this.savedText,
//     this.deleteHelper,
//     this.focused,
//     this.priviusPhysicalKey,
//   });

//   NoteWidgetController copyWith({
//     String? savedText,
//     int? deleteHelper,
//     bool? focused,
//     String? priviusPhysicalKey,
//   }) {
//     return NoteWidgetController(
//       savedText: savedText ?? this.savedText,
//       deleteHelper: deleteHelper ?? this.deleteHelper,
//       focused: focused ?? this.focused,
//       priviusPhysicalKey: priviusPhysicalKey ?? this.priviusPhysicalKey,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'savedText': savedText,
//       'deleteHelper': deleteHelper,
//       'focused': focused,
//     };
//   }

//   String toJson() => json.encode(toMap());
// }

// class NoteWidget extends StatefulWidget {
//   NoteWidget({super.key, required this.note});

//   late NoteModel note;

//   @override
//   State<NoteWidget> createState() => _NoteWidgetState();
// }

// class _NoteWidgetState extends State<NoteWidget> {
//   late String _text;

//   late NoteBloc _noteBloc;
//   final FocusNode _focusNode = FocusNode();

//   NoteWidgetController widgetController = NoteWidgetController();

//   @override
//   void initState() {
//     _text = widget.note.text;
//     _noteBloc = BlocProvider.of<NoteBloc>(context);
//     super.initState();
//     _focusNode.addListener(() {
//       if (_focusNode.hasFocus) {
//         widgetController = widgetController.copyWith(focused: true);
//       } else {
//         if (widgetController.focused == true) {
//           if (widgetController.savedText != null) {
//             _noteBloc.add(EditNote(model: widget.note.copyWith(text: widgetController.savedText!)));
//           }
//         }
//       }
//     });
//   }

//   void _updateText(String newText) => widgetController = widgetController.copyWith(savedText: newText);

//   void handleKeyBoard(KeyEvent event) {
//     if (widgetController.priviusPhysicalKey != event.physicalKey.debugName) {
//       if (event.physicalKey.debugName == 'Tab') {
//         _noteBloc.add(EditNote(model: widget.note.copyWith(padding: (widget.note.padding ?? 0) + 1)));
//       } else {
//         widgetController = widgetController.copyWith(priviusPhysicalKey: event.physicalKey.debugName.toString());
//       }
//     } else {
//       if (event.physicalKey.debugName == 'Enter') {
//         _noteBloc.add(AddNote(model: widget.note.copyWith(text: '')));
//       } else if (event.physicalKey.debugName == 'Backspace') {
//         if (widgetController.savedText != null && widgetController.savedText!.isEmpty) {
//           widgetController = widgetController.copyWith(deleteHelper: (widgetController.deleteHelper ?? 0) + 1);

//           if (widgetController.deleteHelper == 2) {
//             if (widget.note.padding != null && widget.note.padding! > 0) {
//               _noteBloc.add(EditNote(model: widget.note.copyWith(padding: widget.note.padding! - 1, text: widgetController.savedText!)));
//             } else if (widget.note.suffics != null && widget.note.suffics != NoteSuffics.empty) {
//               _noteBloc.add(EditNote(model: widget.note.copyWith(suffics: NoteSuffics.empty, text: widgetController.savedText!)));
//             } else {
//               _noteBloc.add(DeleteNote(id: widget.note.id));
//             }
//           }
//         } else if (widgetController.savedText == null) {
//           if ((widget.note.padding != null && widget.note.padding! > 0)) {
//             _noteBloc.add(EditNote(model: widget.note.copyWith(padding: widget.note.padding! - 1, text: (widgetController.savedText ?? ''))));
//           } else if (widget.note.suffics != null && widget.note.suffics != NoteSuffics.empty) {
//             _noteBloc.add(EditNote(model: widget.note.copyWith(suffics: NoteSuffics.empty, text: widgetController.savedText!)));
//           } else {
//             _noteBloc.add(DeleteNote(id: widget.note.id));
//           }
//         } else {
//           widgetController = widgetController.copyWith(deleteHelper: 0);
//         }
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: 40 * (widget.note.padding ?? 0).toDouble()),
//       child: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 30, top: 12),
//             child: suffics,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 50),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 GestureDetector(
//                   onTap: () => _noteBloc.add(EditMode(key: widget.key as GlobalKey, note: widget.note)),
//                   child: const Icon(Icons.workspaces),
//                 ),
//                 const SizedBox(
//                   width: 40,
//                 ),
//                 Expanded(
//                   child: KeyboardListener(
//                     focusNode: _focusNode,
//                     onKeyEvent: handleKeyBoard,
//                     child: TextFormField(
//                       controller: TextEditingController(text: _text),
//                       maxLines: null,
//                       decoration: const InputDecoration(
//                         border: InputBorder.none,
//                       ),
//                       onChanged: _updateText,
//                       // focusNode: _focusNode,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget? get suffics {
//     if (widget.note.suffics != null) {
//       switch (widget.note.suffics!) {
//         case NoteSuffics.empty:
//           return const Text('');
//         case NoteSuffics.mark:
//           return const Icon(Icons.check_box_outlined);
//         case NoteSuffics.point:
//           return const Text('·');
//         case NoteSuffics.tire:
//           return const Text('-');
//       }
//     }
//     return null;
//   }
// }
