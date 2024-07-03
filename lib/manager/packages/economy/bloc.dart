// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:get_it/get_it.dart';
import 'package:timefull/exports.dart';
import 'package:timefullcore/core.dart';

part 'event.dart';
part 'state.dart';

class EconomyBloc extends Bloc<EconomyBlocEvent, EconomyBlocState> {
  EconomyBloc() : super(EconomyBlocState.initial()) {
    on<Refresh>(_refresh);
    on<AddEconomy>(_add);
    on<AddState>(_addState);
    on<Wipe>(_wipe);
  }
  Future<void> _wipe(
    Wipe event,
    Emitter<EconomyBlocState> emit,
  ) async {
    try {
      emit(state.copyWith(state: EconomyStateBloc.loading));
      final bool economy = await GetIt.I.get<CoreService>().wipeEconomy();
      if (economy) {
        emit(state.copyWith(state: EconomyStateBloc.loaded, economy: await GetIt.I.get<CoreService>().getEconomy()));
      } else {
        emit(state.copyWith(state: EconomyStateBloc.error));
      }
    } catch (_) {
      emit(state.copyWith(state: EconomyStateBloc.error));
    }
  }

  Future<void> _refresh(
    Refresh event,
    Emitter<EconomyBlocState> emit,
  ) async {
    try {
      emit(state.copyWith(state: EconomyStateBloc.loading));
      emit(state.copyWith(state: EconomyStateBloc.loaded, economy: await GetIt.I.get<CoreService>().getEconomy()));
    } catch (_) {
      emit(state.copyWith(state: EconomyStateBloc.error));
    }
  }

  Future<void> _addState(
    AddState event,
    Emitter<EconomyBlocState> emit,
  ) async =>
      emit(state.copyWith(showAddContent: !state.showAddContent));

  Future<void> _add(
    AddEconomy event,
    Emitter<EconomyBlocState> emit,
  ) async {
    try {
      emit(state.copyWith(state: EconomyStateBloc.loading));
      final RepositoryStat economy = await GetIt.I.get<CoreService>().addEconomy(
            title: event.title,
            description: event.title,
            count: event.count,
            date: event.date,
            income: event.income,
          );

      if (economy == RepositoryStat.saved || economy == RepositoryStat.sended) {
        emit(state.copyWith(state: EconomyStateBloc.loaded, economy: await GetIt.I.get<CoreService>().getEconomy(), showAddContent: false));
      } else {
        emit(state.copyWith(state: EconomyStateBloc.error));
      }

      emit(state.copyWith(state: EconomyStateBloc.loaded));
    } catch (_) {
      emit(state.copyWith(state: EconomyStateBloc.error));
    }
  }
}
