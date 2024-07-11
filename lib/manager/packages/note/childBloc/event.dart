// ignore_for_file: public_member_api_docs; sort_constructors_first
// ignore_for_file: non_constant_identifier_names

part of 'bloc.dart';

abstract class PageBlocEvent extends Equatable {}

class RefreshPage extends PageBlocEvent {
  @override
  List<Null> get props => [];
}

class AddPage extends PageBlocEvent {
  @override
  List<Null> get props => [];
}

class EditPage extends PageBlocEvent {
  final PageModel page;

  EditPage({required this.page});
  @override
  List<Null> get props => [];
}

class DeletePage extends PageBlocEvent {
  final int id;

  DeletePage({required this.id});
  @override
  List<Null> get props => [];
}

class AddNote extends PageBlocEvent {
  @override
  List<Null> get props => [];
}

class EditNote extends PageBlocEvent {
  final NoteModel model;

  EditNote({required this.model});
  @override
  List<Null> get props => [];
}

class DeleteNote extends PageBlocEvent {
  final int id;

  DeleteNote({required this.id});
  @override
  List<Null> get props => [];
}
