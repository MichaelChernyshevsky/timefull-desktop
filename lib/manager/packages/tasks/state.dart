// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bloc.dart';

enum TaskStateBloc {
  loading,
  empty,
  loaded,
  error,
}

class TaskBlocState extends Equatable {
  final TaskStateBloc state;
  final TasksModels? tasks;

  const TaskBlocState({
    required this.state,
    this.tasks,
  });

  @override
  List<Object?> get props => [state, tasks];

  TaskBlocState copyWith({
    TaskStateBloc? state,
    TasksModels? tasks,
  }) {
    return TaskBlocState(
      state: state ?? this.state,
      tasks: tasks ?? this.tasks,
    );
  }

  factory TaskBlocState.initial() {
    return const TaskBlocState(state: TaskStateBloc.loading);
  }
}
