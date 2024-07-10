import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timefull/manager/packages/note/bloc.dart';
import 'package:timefull/manager/packages/note/model.dart';
import 'dart:convert';

part './widget/settings.dart';
part './widget/note.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final double _followWidgetPosition = 0.0;
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return BlocBuilder<NoteBloc, NoteBlocState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.only(right: 50),
          width: MediaQuery.of(context).size.width * 0.93,
          height: h,
          color: Colors.white,
          child: state.state == NoteStateBloc.loaded
              ? Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(children: [
                        Text(state.notes.length.toString()),
                        state.notes.isNotEmpty
                            ? Column(
                                children: [
                                  for (final note in state.notes)
                                    note.active != false
                                        ? NoteWidget(
                                            key: GlobalKey(debugLabel: note.id.toString()),
                                            note: note,
                                          )
                                        : const Row()
                                ],
                              )
                            : const CircularProgressIndicator(),
                      ]),
                    ),
                    if (state.isEditMode && state.keyEdit!.currentContext != null)
                      Padding(
                        padding: EdgeInsets.only(top: (state.keyEdit!.currentContext!.findRenderObject() as RenderBox).localToGlobal(Offset.zero).dy + 48, left: 20, bottom: _followWidgetPosition),
                        child: NotesSettings(note: state.note!),
                      ),
                  ],
                )
              : const Center(
                  child: Text('empty'),
                ),
        );
      },
    );
  }
}
