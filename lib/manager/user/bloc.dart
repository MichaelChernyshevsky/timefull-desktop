// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:timefull/exports.dart';

part 'event.dart';
part 'state.dart';

class UserBloc extends Bloc<UserBlocEvent, UserBlocState> {
  UserBloc() : super(UserBlocState.initial()) {
    on<Initialize>(_initialize);
    on<GetUsers>(_getData);
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
}
