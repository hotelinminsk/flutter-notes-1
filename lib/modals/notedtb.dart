import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:newnotesapp/modals/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDtb extends ChangeNotifier {
  static late Isar isar;
  //init
  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([NoteSchema], directory: dir.path);
  }

  //create
  final List<Note> curNotes = [];

  Future<void> addNote(String text) async {
    final note = Note()..text = text;
    isar.writeTxn(() => isar.notes.put(note));
  }

  //read
  Future<void> read() async {
    List<Note> notes = await isar.notes.where().findAll();
    curNotes.clear();
    curNotes.addAll(notes);
    notifyListeners();
  }

  //update
  Future<void> updatenote(int id, String newtxt) async {
    final exnote = await isar.notes.get(id);

    if (exnote != null) {
      exnote.text = newtxt;
      await isar.writeTxn(() => isar.notes.put(exnote));
      await read();
    }
  }

  //del
  Future<void> del(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await read();
  }
}
