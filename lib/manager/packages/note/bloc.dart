// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:get_it/get_it.dart';

import 'package:timefull/exports.dart';
import 'package:timefull/manager/packages/note/model.dart';
import 'package:timefullcore/core.dart';

part 'event.dart';
part 'state.dart';

List<NoteModel> get notes {
  List<NoteModel> n = [];
  for (int index = 0; index <= 50; index++) {
    n.add(NoteModel(suffics: NoteSuffics.empty, text: index.toString(), id: index, active: true));
  }
  return n;
}

class NoteBloc extends Bloc<NoteBlocEvent, NoteBlocState> {
  NoteBloc() : super(NoteBlocState.initial()) {
    on<RefreshNotes>(_refresh);
    on<AddNote>(_add);
    on<EditNote>(_edit);
    on<WipeNotes>(_wipe);
    on<DeleteNote>(_delete);
    on<EditMode>(_editMode);
  }
  Future<void> _editMode(
    EditMode event,
    Emitter<NoteBlocState> emit,
  ) async {
    if (state.note != null && event.note.id == state.note!.id) {
      emit(state.copyWith(keyEdit: null, isEditMode: false, note: null));
    } else {
      emit(state.copyWith(keyEdit: event.key, isEditMode: true, note: event.note));
    }
  }

  Future<void> _refresh(
    RefreshNotes event,
    Emitter<NoteBlocState> emit,
  ) async {
    try {
      emit(state.copyWith(state: NoteStateBloc.loaded, notes: notes));
    } catch (e) {
      emit(state.copyWith(state: NoteStateBloc.error));
    }
  }

  Future<void> _add(
    AddNote event,
    Emitter<NoteBlocState> emit,
  ) async {
    try {
      emit(state.copyWith(state: NoteStateBloc.loading));
      final notes = state.notes;
      notes.add(event.model);
      emit(state.copyWith(state: NoteStateBloc.loaded, notes: notes));
    } catch (e) {
      emit(state.copyWith(state: NoteStateBloc.error));
    }
  }

  Future<void> _edit(
    EditNote event,
    Emitter<NoteBlocState> emit,
  ) async {
    try {
      emit(state.copyWith(state: NoteStateBloc.loading));
      final notes = state.notes;

      final index = notes.indexWhere((model) => model.id == event.model.id);
      if (index != -1) {
        notes[index] = event.model;
      }
      emit(state.copyWith(state: NoteStateBloc.loaded));
    } catch (e) {
      emit(state.copyWith(state: NoteStateBloc.error));
    }
  }

  Future<void> _delete(
    DeleteNote event,
    Emitter<NoteBlocState> emit,
  ) async {
    try {
      emit(state.copyWith(state: NoteStateBloc.loading));
      List<NoteModel> notes = state.notes;
      final index = notes.indexWhere((model) => model.id == event.id);
      if (index != -1) {
        notes[index] = notes[index].copyWith(active: false);
      }
      emit(state.copyWith(state: NoteStateBloc.loaded, notes: notes));
    } catch (e) {
      emit(state.copyWith(state: NoteStateBloc.error));
    }
  }

  Future<void> _wipe(
    WipeNotes event,
    Emitter<NoteBlocState> emit,
  ) async {
    try {
      emit(state.copyWith(state: NoteStateBloc.loaded, notes: []));
    } catch (e) {
      emit(state.copyWith(state: NoteStateBloc.error));
    }
  }
}
