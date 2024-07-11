// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:get_it/get_it.dart';

import 'package:timefull/exports.dart';

import 'package:timefullcore/core.dart';
import 'package:timefullcore/packages/note/models/model.dart';
import 'package:timefullcore/packages/note/models/page_model/model.dart';

part 'event.dart';
part 'state.dart';

class NoteBloc extends Bloc<NoteBlocEvent, NoteBlocState> {
  NoteBloc() : super(NoteBlocState.initial()) {
    on<RefreshNotes>(_refresh);
    on<ChangeShowState>(_changeShowState);
    on<CreatePage>(_createPage);
    on<DeletePage>(_deletePage);
  }

  Future<void> _changeShowState(
    ChangeShowState event,
    Emitter<NoteBlocState> emit,
  ) async =>
      emit(state.copyWith(show: !state.show));

  Future<void> _createPage(
    CreatePage event,
    Emitter<NoteBlocState> emit,
  ) async {
    await GetIt.I.get<CoreService>().addPage(PageModel(id: 0, title: 'Untitled', position: 0, parentId: null));
    emit(state.copyWith(state: NoteStateBloc.loaded, pages: await GetIt.I.get<CoreService>().getPages()));
  }

  Future<void> _refresh(
    RefreshNotes event,
    Emitter<NoteBlocState> emit,
  ) async {
    try {
      emit(state.copyWith(state: NoteStateBloc.loaded, pages: await GetIt.I.get<CoreService>().getPages()));
    } catch (e) {
      emit(state.copyWith(state: NoteStateBloc.error));
    }
  }

  Future<void> _deletePage(
    DeletePage event,
    Emitter<NoteBlocState> emit,
  ) async {
    try {
      await GetIt.I.get<CoreService>().deletePage(event.id);
      emit(state.copyWith(state: NoteStateBloc.loaded, pages: await GetIt.I.get<CoreService>().getPages()));
    } catch (e) {
      emit(state.copyWith(state: NoteStateBloc.error));
    }
  }
}
