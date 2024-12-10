import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_isar/models/note.dart';

class NoteDatabase extends ChangeNotifier {
  static late Isar isar;
  //  I N T I A L I Z E - D A T A B A S E
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [NoteSchema],
      directory: dir.path,
    );
  }

  // lsit of notes
  final List<Note> currentNotes = [];

  // C R E A T E - a note and save to db
  Future<void> addNote(String textFromUser) async {
    // create a new note
    final newNote = Note()..text = textFromUser;

    // save to db
    await isar.writeTxn(() => isar.notes.put(newNote));

    // re-read from database
    fetchNotes();
  }

  // R E A D - a note from db
  Future<void> fetchNotes() async {
    List<Note> fetchedNote = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchedNote);
    notifyListeners();
  }

  // U P D A T E - a note in db
  Future<void> updateNote(int id, String newText) async {
    final existingNotes = await isar.notes.get(id);
    if (existingNotes != null) {
      existingNotes.text = newText;
      await isar.writeTxn(
        () => isar.notes.put(existingNotes),
      );
      await fetchNotes();
    }
  }

  // D E L E T E - a note from the db
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(
      () => isar.notes.delete(id),
    );
    await fetchNotes();
  }
}
