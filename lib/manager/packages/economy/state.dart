// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bloc.dart';

abstract class UserBlocState extends Equatable {}

enum EconomyState {
  loading,
  empty,
  loaded,
  error,
}

class EconomyBlocState extends Equatable {
  final EconomyState state;
  final List<EconomyModel>? economy;
  final bool showAddContent;

  const EconomyBlocState({
    required this.state,
    this.economy,
    required this.showAddContent,
  });

  @override
  List<Object?> get props => [state, economy, showAddContent];

  EconomyBlocState copyWith({
    EconomyState? state,
    List<EconomyModel>? economy,
    bool? showAddContent,
  }) {
    return EconomyBlocState(
      state: state ?? this.state,
      economy: economy ?? this.economy,
      showAddContent: showAddContent ?? this.showAddContent,
    );
  }

  factory EconomyBlocState.initial() {
    return const EconomyBlocState(state: EconomyState.loading, showAddContent: false);
  }
}