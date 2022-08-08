import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'note_model.dart';
import 'notes_notifier.dart';

final notesProvider = StateNotifierProvider<NotesNotifier, List<NoteModel>>(
  (ref) => NotesNotifier(),
);
