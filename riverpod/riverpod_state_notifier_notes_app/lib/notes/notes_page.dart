import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_state_notifier_notes_app/notes/note_model.dart';

import 'notes_provider.dart';

class NotesPage extends HookConsumerWidget {
  NotesPage({Key? key}) : super(key: key);

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  FocusNode titleFocus = FocusNode();
  FocusNode descriptionFocus = FocusNode();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(notesProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Notes App',
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
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                focusNode: titleFocus,
                onFieldSubmitted: (value) {
                  descriptionFocus.requestFocus();
                },
                controller: titleController,
                decoration: InputDecoration(
                  label: const Text('Enter the title'),
                  suffixText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                focusNode: descriptionFocus,
                onFieldSubmitted: (value) {
                  descriptionFocus.requestFocus();
                },
                controller: descriptionController,
                decoration: InputDecoration(
                  label: const Text('Enter the description'),
                  suffixText: 'Description',
                  suffixStyle: const TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.w500,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
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
                        leading: notes[index].isConcluded
                            ? const Icon(
                                CupertinoIcons.checkmark_alt_circle_fill,
                                color: Colors.pink,
                                size: 40,
                              )
                            : const Icon(
                                CupertinoIcons.xmark_octagon_fill,
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
                        subtitle: Text(
                          notes[index].description!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.pink,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
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
          ref.read(notesProvider.notifier).addNote(NoteModel(
              title: titleController.text,
              description: descriptionController.text));
          titleController.clear();
          descriptionController.clear();
        },
        child: const Icon(
          Icons.note_add,
          size: 25,
        ),
      ),
    );
  }
}
