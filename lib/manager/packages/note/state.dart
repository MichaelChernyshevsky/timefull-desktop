// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bloc.dart';

enum NoteStateBloc {
  loading,
  loaded,
  error,
}

class NoteBlocState extends Equatable {
  final NoteStateBloc state;
  final List<PageWithNotes> pages;
  final bool show;

  const NoteBlocState({
    required this.state,
    required this.pages,
    required this.show,
  });

  @override
  List<Object?> get props => [state, pages, show];

  NoteBlocState copyWith({
    NoteStateBloc? state,
    List<PageWithNotes>? pages,
    bool? show,
  }) {
    return NoteBlocState(
      state: state ?? this.state,
      pages: pages ?? this.pages,
      show: show ?? this.show,
    );
  }

  factory NoteBlocState.initial() {
    return const NoteBlocState(state: NoteStateBloc.loading, pages: [], show: true);
  }
}
