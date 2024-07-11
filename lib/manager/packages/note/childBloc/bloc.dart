// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:get_it/get_it.dart';

import 'package:timefull/exports.dart';
import 'package:timefullcore/core.dart';
import 'package:timefullcore/packages/note/models/model.dart';
import 'package:timefullcore/packages/note/models/note_model/model.dart';
import 'package:timefullcore/packages/note/models/page_model/model.dart';

part 'event.dart';
part 'state.dart';

class PageBloc extends Bloc<PageBlocEvent, PageBlocState> {
  PageBloc(PageWithNotes page) : super(PageBlocState.initial(page)) {
    // page
    on<RefreshPage>(_refresh);
    on<AddPage>(_addPage);
    on<EditPage>(_editPage);
    on<DeletePage>(_deletePage);
    // note
    on<AddNote>(_addNote);
    on<EditNote>(_editNote);
    on<DeleteNote>(_deleteNote);
  }

  Future<void> _refresh(
    RefreshPage event,
    Emitter<PageBlocState> emit,
  ) async {
    try {
      // emit(state.copyWith(state: PageStateBloc.loaded, page: await GetIt.I.get<CoreService>().getPages()));
    } catch (e) {
      emit(state.copyWith(state: PageStateBloc.error));
    }
  }

  Future<void> _addPage(
    AddPage event,
    Emitter<PageBlocState> emit,
  ) async {
    try {
      // emit(state.copyWith(state: PageStateBloc.loaded, page: await GetIt.I.get<CoreService>().getPages()));
    } catch (e) {
      emit(state.copyWith(state: PageStateBloc.error));
    }
  }

  Future<void> _editPage(
    EditPage event,
    Emitter<PageBlocState> emit,
  ) async {
    try {
      // emit(state.copyWith(state: PageStateBloc.loaded, page: await GetIt.I.get<CoreService>().getPages()));
    } catch (e) {
      emit(state.copyWith(state: PageStateBloc.error));
    }
  }

  Future<void> _deletePage(
    DeletePage event,
    Emitter<PageBlocState> emit,
  ) async {
    try {
      // emit(state.copyWith(state: PageStateBloc.loaded, page: await GetIt.I.get<CoreService>().getPages()));
    } catch (e) {
      emit(state.copyWith(state: PageStateBloc.error));
    }
  }

  Future<void> _addNote(
    AddNote event,
    Emitter<PageBlocState> emit,
  ) async {
    try {
      // emit(state.copyWith(state: PageStateBloc.loaded, page: await GetIt.I.get<CoreService>().getPages()));
    } catch (e) {
      emit(state.copyWith(state: PageStateBloc.error));
    }
  }

  Future<void> _editNote(
    EditNote event,
    Emitter<PageBlocState> emit,
  ) async {
    try {
      // emit(state.copyWith(state: PageStateBloc.loaded, page: await GetIt.I.get<CoreService>().getPages()));
    } catch (e) {
      emit(state.copyWith(state: PageStateBloc.error));
    }
  }

  Future<void> _deleteNote(
    DeleteNote event,
    Emitter<PageBlocState> emit,
  ) async {
    try {
      // emit(state.copyWith(state: PageStateBloc.loaded, page: await GetIt.I.get<CoreService>().getPages()));
    } catch (e) {
      emit(state.copyWith(state: PageStateBloc.error));
    }
  }
}
