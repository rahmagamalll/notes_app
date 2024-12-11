import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/add_note_to_deleted_cubit/add_note_to_deleted_cubit.dart';
import 'package:notes_app/cubits/delete_notes_cubit/notes_deleted_cubit.dart';
import 'package:notes_app/cubits/note_cubit/note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
    required this.notes,
  });

  final List<NoteModel> notes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      itemCount: notes.length,
      itemBuilder: (context, index) => NoteItem(
        icon: FontAwesomeIcons.trash,
        pushPadgName: EditNoteView.id,
        onPressed: () {

          NoteModel deleteNote = NoteModel(
              title: notes[index].title,
              subTitle: notes[index].subTitle,
              date: notes[index].date,
              color: notes[index].color);

          BlocProvider.of<AddNoteToDeletedCubit>(context)
              .addNoteToDelete(deleteNote);

          notes[index].delete(); //becuse noteModel extend from HiveObject

          BlocProvider.of<NoteCubit>(context)
              .fetchAllNotes();

          BlocProvider.of<NotesDeletedCubit>(context)
              .fetchAllNotesDeleted(); 
        },
        note: notes[index],
      ),
    );
  }
}
