import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_state_notifier_notes_app/notes/note_model.dart';
import 'package:riverpod_state_notifier_notes_app/notes/notes_notifier.dart';

final notesProvider = StateNotifierProvider<NotesNotifier, List<NoteModel>>(
  (ref) => NotesNotifier(),
);

var concludedProvider = StateProvider((ref) => false);

class NotesPage extends HookConsumerWidget {
  NotesPage({Key? key}) : super(key: key);

  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(notesProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Notes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 4,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              style: const TextStyle(
                color: Colors.pink,
              ),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pink,
                    width: 2,
                  ),
                ),
                labelText: 'Enter the title',
                labelStyle: TextStyle(
                  letterSpacing: 3.5,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      ref
                          .read(notesProvider.notifier)
                          .changeNoteState(notes[index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.pink,
                            width: 1.5,
                          ),
                        ),
                        leading: notes[index].isConcluded!
                            ? const Icon(
                                CupertinoIcons.checkmark_alt_circle,
                                color: Colors.pink,
                                size: 40,
                              )
                            : const Icon(
                                CupertinoIcons.xmark_octagon,
                                color: Colors.pink,
                                size: 40,
                              ),
                        title: Text(
                          notes[index].title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete_outline,
                            color: Colors.pink,
                            size: 35,
                          ),
                          onPressed: () {
                            ref
                                .read(notesProvider.notifier)
                                .removeNote(notes[index]);
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref
              .read(notesProvider.notifier)
              .addNote(NoteModel(title: titleController.text));
          titleController.clear();
        },
        child: const Icon(
          Icons.note_add,
          size: 25,
        ),
      ),
    );
  }
}
