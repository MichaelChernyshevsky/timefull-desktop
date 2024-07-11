// ignore_for_file: public_member_api_docs; sort_constructors_first
// ignore_for_file: non_constant_identifier_names

part of 'bloc.dart';

abstract class NoteBlocEvent extends Equatable {}

class RefreshNotes extends NoteBlocEvent {
  @override
  List<Null> get props => [];
}

class ChangeShowState extends NoteBlocEvent {
  @override
  List<Null> get props => [];
}

class CreatePage extends NoteBlocEvent {
  @override
  List<Null> get props => [];
}

class DeletePage extends NoteBlocEvent {
  final int id;

  DeletePage({required this.id});
  @override
  List<Null> get props => [];
}
