// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bloc.dart';

enum NoteStateBloc {
  loading,
  loaded,
  error,
}

class ContentPage {
  final PageWithNotes? page;
  final bool showAllPages;

  ContentPage({required this.page, required this.showAllPages});

  ContentPage copyWith({
    PageWithNotes? page,
    bool? showAllPages,
  }) {
    return ContentPage(
      page: page ?? this.page,
      showAllPages: showAllPages ?? this.showAllPages,
    );
  }
}

class NoteBlocState extends Equatable {
  final NoteStateBloc state;
  final List<PageWithNotes> pages;
  final bool show;
  final ContentPage contentPage;

  const NoteBlocState({
    required this.state,
    required this.pages,
    required this.show,
    required this.contentPage,
  });

  @override
  List<Object?> get props => [state, pages, show, contentPage];

  NoteBlocState copyWith({
    NoteStateBloc? state,
    List<PageWithNotes>? pages,
    bool? show,
    ContentPage? contentPage,
  }) {
    return NoteBlocState(
      state: state ?? this.state,
      pages: pages ?? this.pages,
      show: show ?? this.show,
      contentPage: contentPage ?? this.contentPage,
    );
  }

  factory NoteBlocState.initial() {
    return NoteBlocState(
      state: NoteStateBloc.loading,
      pages: const [],
      show: true,
      contentPage: ContentPage(
        showAllPages: true,
        page: null,
      ),
    );
  }
}
