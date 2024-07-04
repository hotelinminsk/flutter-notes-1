import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newnotesapp/components/note_tile.dart';
import 'package:newnotesapp/modals/notedtb.dart';
import 'package:newnotesapp/modals/note.dart';
import 'package:provider/provider.dart';
import 'package:newnotesapp/components/mydrw.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<NoteDtb>().read();
  }
  //create a note

  void createNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Create a Note!",
          style: GoogleFonts.dmSerifText(
            fontSize: 24,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        content: TextField(
          autofocus: true,
          textCapitalization: TextCapitalization.sentences,
          controller: textController,
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              context.read<NoteDtb>().addNote(textController.text);
              context.read<NoteDtb>().read();
              textController.clear();
              Navigator.pop(context);
            },
            child: Text("Create!"),
          )
        ],
      ),
    );
  }

  void updateNote(Note note) {
    textController.text = note.text;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        content: TextField(
          controller: textController,
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              context.read<NoteDtb>().updatenote(note.id, textController.text);
              textController.clear();
              Navigator.pop(context);
            },
            child: Text("Update note!"),
          )
        ],
      ),
    );
  }

  void deleteNote(int id) {
    context.read<NoteDtb>().del(id);
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    final dtb = context.watch<NoteDtb>();

    List<Note> curnotes = dtb.curNotes;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNote();
        },
        backgroundColor: theme.surface,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      drawer: Mydrw(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Notes",
                textAlign: TextAlign.left,
                style: GoogleFonts.dmSerifText(
                  fontSize: 48,
                  color: Theme.of(context).colorScheme.inversePrimary,
                )),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: curnotes.length,
              itemBuilder: (context, index) {
                final indvnote = curnotes.elementAt(index);
                return NoteTile(
                    text: indvnote.text,
                    deleteFunc: () {
                      deleteNote(indvnote.id);
                    },
                    updateFunc: () {
                      updateNote(indvnote);
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
