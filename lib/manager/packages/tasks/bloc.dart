// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:get_it/get_it.dart';
import 'package:timefull/exports.dart';
import 'package:timefullcore/core.dart';

part 'event.dart';
part 'state.dart';

class TaskBloc extends Bloc<TaskBlocEvent, TaskBlocState> {
  TaskBloc() : super(TaskBlocState.initial()) {
    on<RefreshTasks>(_refresh);
    on<AddTask>(_add);
    on<EditTask>(_edit);
    on<WipeTasks>(_wipe);
  }

  Future<void> _refresh(
    RefreshTasks event,
    Emitter<TaskBlocState> emit,
  ) async {
    try {
      emit(state.copyWith(state: TaskStateBloc.loading));

      final TasksModels tasks = await GetIt.I.get<CoreService>().getTasks();
    } catch (e) {
      emit(state.copyWith(state: TaskStateBloc.error));
    }
  }

  Future<void> _add(
    AddTask event,
    Emitter<TaskBlocState> emit,
  ) async {
    try {
      emit(state.copyWith(state: TaskStateBloc.loading));
    } catch (e) {
      emit(state.copyWith(state: TaskStateBloc.error));
    }
  }

  Future<void> _edit(
    EditTask event,
    Emitter<TaskBlocState> emit,
  ) async {
    try {
      emit(state.copyWith(state: TaskStateBloc.loading));
    } catch (e) {
      emit(state.copyWith(state: TaskStateBloc.error));
    }
  }

  Future<void> _wipe(
    WipeTasks event,
    Emitter<TaskBlocState> emit,
  ) async {
    try {
      emit(state.copyWith(state: TaskStateBloc.loading));
    } catch (e) {
      emit(state.copyWith(state: TaskStateBloc.error));
    }
  }
}
