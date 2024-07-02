// ignore_for_file: public_member_api_docs; sort_constructors_first
// ignore_for_file: non_constant_identifier_names

part of 'bloc.dart';

abstract class EconomyBlocEvent extends Equatable {}

class Refresh extends EconomyBlocEvent {
  @override
  List<Null> get props => [];
}

class AddState extends EconomyBlocEvent {
  @override
  List<Null> get props => [];
}

class AddEconomy extends EconomyBlocEvent {
  final String title;
  final String description;
  final int count;
  final int date;
  final bool income;

  AddEconomy({
    required this.title,
    required this.description,
    required this.count,
    required this.date,
    required this.income,
  });
  @override
  List<dynamic> get props => [
        title,
        description,
        count,
        date,
        income,
      ];
}
