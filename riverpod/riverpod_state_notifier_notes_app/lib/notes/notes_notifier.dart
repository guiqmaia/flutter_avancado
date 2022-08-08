import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'note_model.dart';

class NotesNotifier extends StateNotifier<List<NoteModel>> {
  NotesNotifier() : super([]);

  void addNote(NoteModel note) {
    state = [note, ...state];
  }

  void removeNote(NoteModel note) {
    state = state.where((noteOfList) => noteOfList != note).toList();
  }

  void changeNoteState(NoteModel note) {
    NoteModel novaNote = NoteModel(
      title: note.title,
      description: note.description,
      isConcluded: !note.isConcluded,
    );
    state = state.where((noteOfList) => noteOfList != note).toList();

    state = [novaNote, ...state];
  }
}
