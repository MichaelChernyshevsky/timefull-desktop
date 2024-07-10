// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bloc.dart';

enum TaskStateBloc {
  loading,
  loaded,
  error,
}

class TaskBlocState extends Equatable {
  final TaskStateBloc state;
  final TasksModels? tasks;
  final bool showAddContent;

  const TaskBlocState({
    required this.state,
    this.tasks,
    required this.showAddContent,
  });

  @override
  List<Object?> get props => [state, tasks, showAddContent];

  TaskBlocState copyWith({
    TaskStateBloc? state,
    TasksModels? tasks,
    bool? showAddContent,
  }) {
    return TaskBlocState(
      state: state ?? this.state,
      tasks: tasks ?? this.tasks,
      showAddContent: showAddContent ?? this.showAddContent,
    );
  }

  factory TaskBlocState.initial() {
    return const TaskBlocState(state: TaskStateBloc.loading, showAddContent: false);
  }
}
