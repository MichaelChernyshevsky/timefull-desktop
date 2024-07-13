// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bloc.dart';

enum PageStateBloc {
  loading,
  loaded,
  error,
}

class PageBlocState extends Equatable {
  final PageStateBloc state;
  final PageWithNotes? page;

  const PageBlocState({
    required this.state,
    required this.page,
  });

  @override
  List<Object?> get props => [
        state,
        page,
      ];

  PageBlocState copyWith({
    PageStateBloc? state,
    PageWithNotes? page,
  }) {
    return PageBlocState(
      state: state ?? this.state,
      page: page ?? this.page,
    );
  }

  factory PageBlocState.initial() {
    return const PageBlocState(state: PageStateBloc.loading, page: null);
  }
}
