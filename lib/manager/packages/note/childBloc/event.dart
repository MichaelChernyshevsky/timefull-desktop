// ignore_for_file: public_member_api_docs; sort_constructors_first
// ignore_for_file: non_constant_identifier_names

part of 'bloc.dart';

abstract class PageBlocEvent extends Equatable {}

class RefreshPageChild extends PageBlocEvent {
  @override
  List<Null> get props => [];
}

class AddPageChild extends PageBlocEvent {
  @override
  List<Null> get props => [];
}

class InitializeChild extends PageBlocEvent {
  final PageWithNotes page;

  InitializeChild({required this.page});
  @override
  List<Null> get props => [];
}

class EditPageChild extends PageBlocEvent {
  final PageModel page;

  EditPageChild({required this.page});
  @override
  List<Null> get props => [];
}

class EditTitleChild extends PageBlocEvent {
  final String? title;

  EditTitleChild({required this.title});
  @override
  List<Null> get props => [];
}

class DeletePageChild extends PageBlocEvent {
  final int id;

  DeletePageChild({required this.id});
  @override
  List<Null> get props => [];
}

class AddNoteChild extends PageBlocEvent {
  final NoteModel noteFather;

  AddNoteChild(this.noteFather);
  @override
  List<Null> get props => [];
}

class EditNoteChild extends PageBlocEvent {
  final NoteModel model;

  EditNoteChild({required this.model});
  @override
  List<Null> get props => [];
}

class DeleteNoteChild extends PageBlocEvent {
  final int id;

  DeleteNoteChild({required this.id});
  @override
  List<Null> get props => [];
}
