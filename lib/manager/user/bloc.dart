// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:get_it/get_it.dart';
import 'package:timefull/exports.dart';
import 'package:timefullcore/core.dart';
import 'package:timefullcore/packages/note/models/model.dart';

part 'event.dart';
part 'state.dart';

class UserBloc extends Bloc<UserBlocEvent, UserBlocState> {
  UserBloc() : super(UserBlocState.initial()) {
    on<Initialize>(_initialize);
    on<GetUsers>(_getData);
    on<SignIn>(_signIn);
    on<SignOut>(_signOut);
    on<WithoutAuth>(_withoutAuth);

    // packages
    on<ChangePackage>(_changePackage);
    on<RefreshPackages>(_refreshPackages);
  }
  Future<void> _initialize(
    Initialize event,
    Emitter<UserBlocState> emit,
  ) async {
    try {
      final packages = await GetIt.I.get<CoreService>().packageGet();

      emit(state.copyWith(
        authed: GetIt.I.get<CoreService>().userRepo.loggined,
        packages: packages,
        statePackages: PackagesStateBloc.loaded,
        stateUser: UserStateBloc.loaded,
      ));
    } catch (_) {}
  }

  Future<void> _getData(
    GetUsers event,
    Emitter<UserBlocState> emit,
  ) async {
    emit(state.copyWith(stateUser: UserStateBloc.loading));
    try {} catch (_) {
      emit(state.copyWith(stateUser: UserStateBloc.loaded));
    }
  }

  Future<void> _refreshPackages(
    RefreshPackages event,
    Emitter<UserBlocState> emit,
  ) async {
    try {
      emit(state.copyWith(statePackages: PackagesStateBloc.loading));
      final packages = await GetIt.I.get<CoreService>().packageGet();
      emit(state.copyWith(packages: packages, statePackages: PackagesStateBloc.loaded));
    } catch (_) {
      emit(state.copyWith(statePackages: PackagesStateBloc.error));
    }
  }

  Future<void> _changePackage(
    ChangePackage event,
    Emitter<UserBlocState> emit,
  ) async {
    emit(state.copyWith(statePackages: PackagesStateBloc.loading));
    try {
      final res = await GetIt.I.get<CoreService>().packageChange(type: event.type);
      if (res) {
        final packages = await GetIt.I.get<CoreService>().packageGet();
        emit(state.copyWith(packages: packages, statePackages: PackagesStateBloc.loaded));
      }
    } catch (_) {
      emit(state.copyWith(statePackages: PackagesStateBloc.error));
    }
  }

  Future<void> _signIn(
    SignIn event,
    Emitter<UserBlocState> emit,
  ) async {
    try {
      await GetIt.I.get<CoreService>().signIn(email: event.email, password: event.password);

      emit(state.copyWith(stateUser: UserStateBloc.loaded, authed: GetIt.I.get<CoreService>().userRepo.loggined));
    } catch (_) {
      emit(state.copyWith(stateUser: UserStateBloc.loaded));
    }
  }

  Future<void> _signOut(
    SignOut event,
    Emitter<UserBlocState> emit,
  ) async {
    try {
      emit(state.copyWith(stateUser: UserStateBloc.loaded, authed: false));
    } catch (_) {
      emit(state.copyWith(stateUser: UserStateBloc.loaded));
    }
  }

  Future<void> _withoutAuth(
    WithoutAuth event,
    Emitter<UserBlocState> emit,
  ) async {
    try {
      emit(state.copyWith(stateUser: UserStateBloc.loaded, authed: false));
    } catch (_) {
      emit(state.copyWith(stateUser: UserStateBloc.loaded));
    }
  }
}
