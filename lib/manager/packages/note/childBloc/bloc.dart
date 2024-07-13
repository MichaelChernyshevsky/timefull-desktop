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
  PageBloc() : super(PageBlocState.initial()) {
    // Initialize
    on<InitializeChild>(_initialize);

    // page
    on<RefreshPageChild>(_refresh);
    on<AddPageChild>(_addPage);
    on<EditPageChild>(_editPage);
    on<DeletePageChild>(_deletePage);
    on<EditTitleChild>(_editTitle);
    // note
    on<AddNoteChild>(_addNote);
    on<EditNoteChild>(_editNote);
    on<DeleteNoteChild>(_deleteNote);
  }

  Future<void> _initialize(
    InitializeChild event,
    Emitter<PageBlocState> emit,
  ) async =>
      emit(state.copyWith(state: PageStateBloc.loaded, page: event.page));

  Future<void> _editTitle(
    EditTitleChild event,
    Emitter<PageBlocState> emit,
  ) async {
    try {
      await GetIt.I.get<CoreService>().editPage(state.page!.page.copyWith(title: event.title));
      emit(state.copyWith(page: await GetIt.I.get<CoreService>().getPageById(state.page!.page.id)));
    } catch (e) {
      emit(state.copyWith(state: PageStateBloc.error));
    }
  }

  Future<void> _refresh(
    RefreshPageChild event,
    Emitter<PageBlocState> emit,
  ) async {
    try {
      // emit(state.copyWith(state: PageStateBloc.loaded, page: await GetIt.I.get<CoreService>().getPages()));
    } catch (e) {
      emit(state.copyWith(state: PageStateBloc.error));
    }
  }

  Future<void> _addPage(
    AddPageChild event,
    Emitter<PageBlocState> emit,
  ) async {
    try {
      // emit(state.copyWith(state: PageStateBloc.loaded, page: await GetIt.I.get<CoreService>().getPages()));
    } catch (e) {
      emit(state.copyWith(state: PageStateBloc.error));
    }
  }

  Future<void> _editPage(
    EditPageChild event,
    Emitter<PageBlocState> emit,
  ) async {
    try {
      await GetIt.I.get<CoreService>().editPage(event.page);
      final page = await GetIt.I.get<CoreService>().getPageById(state.page!.page.id);
      emit(state.copyWith(page: page));
    } catch (e) {
      emit(state.copyWith(state: PageStateBloc.error));
    }
  }

  Future<void> _deletePage(
    DeletePageChild event,
    Emitter<PageBlocState> emit,
  ) async {
    try {
      // emit(state.copyWith(state: PageStateBloc.loaded, page: await GetIt.I.get<CoreService>().getPages()));
    } catch (e) {
      emit(state.copyWith(state: PageStateBloc.error));
    }
  }

  Future<void> _addNote(
    AddNoteChild event,
    Emitter<PageBlocState> emit,
  ) async {
    try {
      await GetIt.I.get<CoreService>().addNoteAfterParent(event.noteFather);
      emit(state.copyWith(page: await GetIt.I.get<CoreService>().getPageById(state.page!.page.id)));
    } catch (e) {
      emit(state.copyWith(state: PageStateBloc.error));
    }
  }

  Future<void> _editNote(
    EditNoteChild event,
    Emitter<PageBlocState> emit,
  ) async {
    try {
      await GetIt.I.get<CoreService>().editNote(event.model);
      emit(state.copyWith(page: await GetIt.I.get<CoreService>().getPageById(state.page!.page.id)));
    } catch (e) {
      emit(state.copyWith(state: PageStateBloc.error));
    }
  }

  Future<void> _deleteNote(
    DeleteNoteChild event,
    Emitter<PageBlocState> emit,
  ) async {
    try {
      // emit(state.copyWith(state: PageStateBloc.loaded, page: await GetIt.I.get<CoreService>().getPages()));
    } catch (e) {
      emit(state.copyWith(state: PageStateBloc.error));
    }
  }
}
