import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timefull/manager/packages/note/bloc.dart';
import 'dart:convert';

import 'package:timefullcore/packages/note/models/note_model/model.dart';

// part './widget/settings.dart';
// part './widget/note.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  late NoteBloc _noteBloc;

  @override
  void initState() {
    super.initState();
    _noteBloc = BlocProvider.of<NoteBloc>(context);
  }

  void changeShowState() => _noteBloc.add(ChangeShowState());

  void addPage() => _noteBloc.add(CreatePage());

  void deletePade(int id) => _noteBloc.add(DeletePage(id: id));
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return BlocBuilder<NoteBloc, NoteBlocState>(
      builder: (context, state) {
        return Row(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 50),
              width: MediaQuery.of(context).size.width * (state.show ? 0.13 : 0.03),
              height: h,
              color: Colors.grey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(onTap: changeShowState, child: Container(width: 100, height: 10, color: Colors.green)),
                    Row(
                      children: [
                        const Text('Pages'),
                        GestureDetector(
                          onTap: addPage,
                          child: const Icon(Icons.add),
                        )
                      ],
                    ),
                    Column(
                        children: state.pages.isNotEmpty
                            ? state.pages
                                .map(
                                  (page) => Row(children: [
                                    Text(page.page.title),
                                    GestureDetector(
                                      onTap: () => deletePade(page.page.id),
                                      child: const Icon(Icons.remove),
                                    )
                                  ]),
                                )
                                .toList()
                            : [const Text('empty')]),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 50),
              width: MediaQuery.of(context).size.width * (!state.show ? 0.90 : 0.80),
              height: h,
              color: Colors.white,
              child: Column(
                  children: state.pages.isEmpty
                      ? [
                          Center(
                            child: Column(
                              children: [
                                const Text('You dont have pages yet'),
                                GestureDetector(
                                  onTap: addPage,
                                  child: const Text('Create Page'),
                                ),
                              ],
                            ),
                          )
                        ]
                      : []),
            ),
          ],
        );
      },
    );
  }
}



// Container(
//           padding: const EdgeInsets.only(right: 50),
//           width: MediaQuery.of(context).size.width * 0.93,
//           height: h,
//           color: Colors.white,
//           child: state.state == NoteStateBloc.loaded
//               ? Stack(
//                   children: [
//                     SingleChildScrollView(
//                       child: Column(children: [
//                         Text(state.notes.length.toString()),
//                         state.notes.isNotEmpty
//                             ? Column(
//                                 children: [
//                                   for (final note in state.notes)
//                                     note.active != false
//                                         ? NoteWidget(
//                                             key: GlobalKey(debugLabel: note.id.toString()),
//                                             note: note,
//                                           )
//                                         : const Row()
//                                 ],
//                               )
//                             : const CircularProgressIndicator(),
//                       ]),
//                     ),
//                     if (state.isEditMode && state.keyEdit!.currentContext != null)
//                       Padding(
//                         padding: EdgeInsets.only(top: (state.keyEdit!.currentContext!.findRenderObject() as RenderBox).localToGlobal(Offset.zero).dy + 48, left: 20, bottom: _followWidgetPosition),
//                         child: NotesSettings(note: state.note!),
//                       ),
//                   ],
//                 )
//               : const Center(
//                   child: Text('empty'),
//                 ),
//         )