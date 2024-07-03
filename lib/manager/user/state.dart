part of 'bloc.dart';
// abstract class UserBlocState extends Equatable {}

enum UserStateBloc {
  loading,
  empty,
  loaded,
}

enum PackagesStateBloc {
  loading,
  loaded,
  error,
}

class UserBlocState extends Equatable {
  final bool? authed;
  final UserModel? user;
  final PackagesStateBloc statePackages;
  final UserStateBloc stateUser;
  final Map<String, String>? packages;
  final PackagesContent? content;

  const UserBlocState({
    required this.authed,
    required this.stateUser,
    required this.statePackages,
    this.packages,
    this.user,
    this.content,
  });

  @override
  List<Object?> get props => [authed, user, stateUser, statePackages];

  UserBlocState copyWith({
    bool? authed,
    UserModel? user,
    UserStateBloc? stateUser,
    Map<String, String>? packages,
    PackagesStateBloc? statePackages,
  }) {
    return UserBlocState(
      authed: authed ?? this.authed,
      user: user ?? this.user,
      stateUser: stateUser ?? this.stateUser,
      packages: packages ?? this.packages,
      statePackages: statePackages ?? this.statePackages,
      content: packages != null ? PackagesContent.fromJson(packages) : content,
    );
  }

  factory UserBlocState.initial() {
    return UserBlocState(authed: GetIt.I.get<CoreService>().userRepo.loggined, stateUser: UserStateBloc.loading, statePackages: PackagesStateBloc.loading);
  }
}

class PackagesContent {
  final bool economy;
  final bool task;
  final bool timer;

  PackagesContent({
    required this.economy,
    required this.task,
    required this.timer,
  });

  factory PackagesContent.fromJson(Map<String, String> json) {
    return PackagesContent(
      economy: json['economy'] == 'true',
      task: json['task'] == 'true',
      timer: json['timer'] == 'true',
    );
  }
}
