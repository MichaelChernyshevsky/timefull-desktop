// ignore_for_file: public_member_api_docs; sort_constructors_first
// ignore_for_file: non_constant_identifier_names

part of 'bloc.dart';

abstract class NoteBlocEvent extends Equatable {}

class WipeNotes extends NoteBlocEvent {
  @override
  List<Null> get props => [];
}

class RefreshNotes extends NoteBlocEvent {
  @override
  List<Null> get props => [];
}

class AddNote extends NoteBlocEvent {
  final NoteModel model;

  AddNote({required this.model});
  @override
  List<Null> get props => [];
}

class EditNote extends NoteBlocEvent {
  final NoteModel model;

  EditNote({required this.model});

  @override
  List<Null> get props => [];
}

class EditMode extends NoteBlocEvent {
  final GlobalKey? key;
  final NoteModel note;

  EditMode({required this.note, this.key});

  @override
  List<Null> get props => [];
}

class DeleteNote extends NoteBlocEvent {
  final int id;

  DeleteNote({required this.id});
  @override
  List<int> get props => [id];
}
