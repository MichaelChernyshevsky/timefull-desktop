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
  }
  Future<void> _refresh(
    Refresh event,
    Emitter<EconomyBlocState> emit,
  ) async {
    try {
      emit(state.copyWith(state: EconomyState.loading));
      final List<EconomyModel> economy = await GetIt.I.get<CoreService>().getEconomy();
      emit(state.copyWith(state: EconomyState.loaded, economy: economy));
    } catch (_) {
      emit(state.copyWith(state: EconomyState.error));
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
      print('start');
      emit(state.copyWith(state: EconomyState.loading));
      final RepositoryStat economy = await GetIt.I.get<CoreService>().addEconomy(
            title: event.title,
            description: event.title,
            count: event.count,
            date: event.date,
            income: event.income,
          );
      print(economy);

      if (economy == RepositoryStat.saved || economy == RepositoryStat.sended) {
        final List<EconomyModel> economy = await GetIt.I.get<CoreService>().getEconomy();
        emit(state.copyWith(state: EconomyState.loaded, economy: economy, showAddContent: false));
      } else {
        emit(state.copyWith(state: EconomyState.error));
      }

      emit(state.copyWith(state: EconomyState.loaded));
    } catch (_) {
      emit(state.copyWith(state: EconomyState.error));
    }
  }
}
