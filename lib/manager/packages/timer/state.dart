// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bloc.dart';

enum TimerStateBloc {
  loading,
  empty,
  loaded,
  error,
}

class TimerBlocState extends Equatable {
  final TimerStateBloc state;
  final Connector? model;

  const TimerBlocState({
    required this.state,
    this.model,
  });

  @override
  List<Object?> get props => [state, model];

  TimerBlocState copyWith({
    TimerStateBloc? state,
    Connector? model,
  }) {
    return TimerBlocState(
      state: state ?? this.state,
      model: model ?? this.model,
    );
  }

  factory TimerBlocState.initial() {
    return const TimerBlocState(state: TimerStateBloc.loading);
  }
}
