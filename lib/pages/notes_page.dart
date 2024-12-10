import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_isar/models/note.dart';
import 'package:todo_isar/models/note_database.dart';
import 'package:todo_isar/pages/widget/my_drawer.dart';
import 'package:todo_isar/pages/widget/note_tile.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({
    super.key,
  });

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  // text controller
  final textController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // on startup, fetch exiting notes
    readNote();
  }

  // create note
  void createNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text(
          'Create Note',
        ),
        content: TextField(
          controller: textController,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero, // Membuat sudutnya menjadi siku-siku
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              // add to db
              context.read<NoteDatabase>().addNote(
                    textController.text,
                  );
              // clear controller
              Navigator.pop(context);
              // pop the navigation
              textController.clear();
            },
            child: Text('Create'),
          )
        ],
      ),
    );
  }

  // read a note
  void readNote() {
    context.read<NoteDatabase>().fetchNotes();
  }

  // update a note
  void updateNote(Note note) {
    // pre-fill thevcurrent note text
    textController.text = note.text;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text(
          'Update Note',
        ),
        content: TextField(
          controller: textController,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero, // Membuat sudutnya menjadi siku-siku
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              // add to db
              context
                  .read<NoteDatabase>()
                  .updateNote(note.id, textController.text);
              // clear controller
              Navigator.pop(context);
              // pop the navigation
              textController.clear();
            },
            child: Text('Update'),
          )
        ],
      ),
    );
  }

  // delete a note
  void deleteNote(int id) {
    context.read<NoteDatabase>().deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {
    final noteDatabase = context.watch<NoteDatabase>();
    List<Note> currentNotes = noteDatabase.currentNotes;
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          centerTitle: false,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // heading
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text(
                'Note',
                style: GoogleFonts.dmSerifText(
                    fontSize: 48,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ),
            // list note
            Expanded(
              child: ListView.builder(
                itemCount: currentNotes.length,
                itemBuilder: (BuildContext context, int index) {
                  final note = currentNotes[index];
                  return NoteTile(
                    text: note.text,
                    onEditPressed: () => updateNote(note),
                    onRemovePressed: () => deleteNote(note.id),
                  );
                },
              ),
            ),
          ],
        ),
        drawer: MyDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: createNote,
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: CircleBorder(),
          child: Icon(
            Icons.add,
            size: 30,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ));
  }
}
