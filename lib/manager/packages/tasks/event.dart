// ignore_for_file: public_member_api_docs; sort_constructors_first
// ignore_for_file: non_constant_identifier_names

part of 'bloc.dart';

abstract class TaskBlocEvent extends Equatable {}

class WipeTasks extends TaskBlocEvent {
  @override
  List<Null> get props => [];
}

class RefreshTasks extends TaskBlocEvent {
  @override
  List<Null> get props => [];
}

class AddTask extends TaskBlocEvent {
  final TaskModel model;

  AddTask({required this.model});
  @override
  List<Null> get props => [];
}

class EditTask extends TaskBlocEvent {
  @override
  List<Null> get props => [];
}
