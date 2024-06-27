part of 'bloc.dart';
// abstract class UserBlocState extends Equatable {}

enum UserState {
  loading,
  empty,
  loaded,
}

class UserBlocState extends Equatable {
  final bool authed;
  final UserModel? user;
  final UserState state;

  const UserBlocState({
    required this.authed,
    required this.state,
    this.user,
  });

  @override
  List<Object?> get props => [authed, user, state];

  UserBlocState copyWith({
    bool? authed,
    UserModel? user,
    UserState? state,
  }) {
    return UserBlocState(
      authed: authed ?? this.authed,
      user: user ?? this.user,
      state: state ?? this.state,
    );
  }

  factory UserBlocState.initial() {
    return const UserBlocState(authed: false, state: UserState.loading);
  }
}
