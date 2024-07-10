// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bloc.dart';

enum NoteStateBloc {
  loading,
  loaded,
  error,
}

class NoteBlocState extends Equatable {
  final NoteStateBloc state;
  final List<NoteModel> notes;
  final bool isEditMode;
  final GlobalKey? keyEdit;
  final NoteModel? note;

  const NoteBlocState({
    required this.state,
    required this.notes,
    required this.isEditMode,
    this.keyEdit,
    this.note,
  });

  @override
  List<Object?> get props => [state, notes, isEditMode, keyEdit];

  NoteBlocState copyWith({
    NoteStateBloc? state,
    List<NoteModel>? notes,
    bool? isEditMode,
    GlobalKey? keyEdit,
    NoteModel? note,
  }) {
    return NoteBlocState(
      state: state ?? this.state,
      notes: notes ?? this.notes,
      isEditMode: isEditMode ?? this.isEditMode,
      keyEdit: keyEdit ?? this.keyEdit,
      note: note ?? this.note,
    );
  }

  factory NoteBlocState.initial() {
    return const NoteBlocState(state: NoteStateBloc.loading, isEditMode: false, notes: []);
  }
}
