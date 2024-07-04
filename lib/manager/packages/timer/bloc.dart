// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:get_it/get_it.dart';
import 'package:timefull/exports.dart';
import 'package:timefullcore/core.dart';

part 'event.dart';
part 'state.dart';

class TimerBloc extends Bloc<TimerBlocEvent, TimerBlocState> {
  TimerBloc() : super(TimerBlocState.initial()) {
    _subscription.add(GetIt.I.get<CoreService>().timerRepo.stream.listen(_listener));
    on<ChangeTimer>(_change);
    on<ActionTimer>(_action);
    on<Wipe>(_wipe);
  }

  final List<StreamSubscription> _subscription = [];

  void _listener(Connector model) {
    emit(state.copyWith(state: TimerStateBloc.loaded, model: model));
  }

  Future<void> _change(
    ChangeTimer event,
    Emitter<TimerBlocState> emit,
  ) async {
    if (event.isWork != null) {
      GetIt.I.get<CoreService>().timerRepo.change(
            isWork: event.isWork!,
            isIncrease: event.isIncrease!,
            work: state.model!.timeWork,
            relax: state.model!.timeRelax,
          );
    } else {
      GetIt.I.get<CoreService>().timerRepo.setTimerForm(event.form!);
    }
  }

  Future<void> _action(
    ActionTimer event,
    Emitter<TimerBlocState> emit,
  ) async =>
      GetIt.I.get<CoreService>().actionTimer();

  Future<void> _wipe(
    Wipe event,
    Emitter<TimerBlocState> emit,
  ) async =>
      GetIt.I.get<CoreService>().wipeTimer();
}
