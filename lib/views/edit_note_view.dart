import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});
  static String id = 'EditNoteView';
  @override
  Widget build(BuildContext context) {
    final NoteModel note =
        ModalRoute.of(context)!.settings.arguments as NoteModel;
    return Scaffold(
      body: EditNoteViewBody(
        note: note,
      ),
    );
  }
}
