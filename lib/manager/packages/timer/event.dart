// ignore_for_file: public_member_api_docs; sort_constructors_first
// ignore_for_file: non_constant_identifier_names

part of 'bloc.dart';

abstract class TimerBlocEvent extends Equatable {}

class Wipe extends TimerBlocEvent {
  @override
  List<Null> get props => [];
}

class ActionTimer extends TimerBlocEvent {
  @override
  List<Null> get props => [];
}

class ChangeTimer extends TimerBlocEvent {
  final bool? isWork;
  final bool? isIncrease;
  final int? form;

  ChangeTimer({this.isWork, this.isIncrease, this.form});
  @override
  List<Null> get props => [];
}
