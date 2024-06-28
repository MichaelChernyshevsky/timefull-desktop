// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:get_it/get_it.dart';
import 'package:timefull/exports.dart';
import 'package:timefullcore/core.dart';

part 'event.dart';
part 'state.dart';

class UserBloc extends Bloc<UserBlocEvent, UserBlocState> {
  UserBloc() : super(UserBlocState.initial()) {
    on<Initialize>(_initialize);
    on<GetUsers>(_getData);
    on<SignIn>(_signIn);
  }
  Future<void> _initialize(
    Initialize event,
    Emitter<UserBlocState> state,
  ) async {
    try {} catch (_) {}
  }

  Future<void> _getData(
    GetUsers event,
    Emitter<UserBlocState> emit,
  ) async {
    emit(state.copyWith(state: UserState.loading));
    try {} catch (_) {
      emit(state.copyWith(state: UserState.loaded));
    }
  }

  Future<void> _signIn(
    SignIn event,
    Emitter<UserBlocState> emit,
  ) async {
    try {
      await GetIt.I.get<CoreService>().signIn(email: event.email, password: event.password);

      emit(state.copyWith(state: UserState.loaded, authed: GetIt.I.get<CoreService>().userRepo.loggined));
    } catch (_) {
      emit(state.copyWith(state: UserState.loaded));
    }
  }
}
