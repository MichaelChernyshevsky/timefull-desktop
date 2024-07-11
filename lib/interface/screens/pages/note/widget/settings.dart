// part of '../screen.dart';

// class NotesSettings extends StatefulWidget {
//   const NotesSettings({super.key, required this.note});

//   final NoteModel note;

//   @override
//   State<NotesSettings> createState() => _NotesSettingsState();
// }

// class _NotesSettingsState extends State<NotesSettings> {
//   late NoteBloc _noteBloc;

//   @override
//   void initState() {
//     super.initState();
//     _noteBloc = BlocProvider.of<NoteBloc>(context);
//   }

//   void editSuffics(NoteSuffics suffics) => _noteBloc.add(EditNote(model: widget.note.copyWith(suffics: suffics)));

//   void delete() => _noteBloc.add(DeleteNote(id: widget.note.id));

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       width: 200,
//       color: Colors.grey[500],
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text('Common'),
//             Padding(
//               padding: const EdgeInsets.only(left: 40),
//               child: Column(
//                 children: ((NoteSuffics.values).map(
//                   (suffics) => GestureDetector(
//                     onTap: () => editSuffics(suffics),
//                     child: Text(suffics.toString().split('.')[1]),
//                   ),
//                 )).toList(),
//               ),
//             ),
//             Column(
//               children: [
//                 GestureDetector(
//                   onTap: delete,
//                   child: const Text('Delete'),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
