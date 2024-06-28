// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

part of 'bloc.dart';

abstract class UserBlocEvent extends Equatable {}

class GetUsers extends UserBlocEvent {
  @override
  List<Null> get props => [];
}

class Initialize extends UserBlocEvent {
  @override
  List<Null> get props => [];
}

class SignIn extends UserBlocEvent {
  final String email;
  final String password;

  SignIn({required this.email, required this.password});
  @override
  List<String> get props => [email, password];
}

class SignOut extends UserBlocEvent {
  @override
  List<Null> get props => [];
}

class SignUp extends UserBlocEvent {
  final String email;
  final String password;

  SignUp({required this.email, required this.password});
  @override
  List<String> get props => [email, password];
}

class UpdateUser extends UserBlocEvent {
  @override
  List<Null> get props => [];
}

class GetPackages extends UserBlocEvent {
  @override
  List<Null> get props => [];
}

class ChangePackage extends UserBlocEvent {
  @override
  List<Null> get props => [];
}
