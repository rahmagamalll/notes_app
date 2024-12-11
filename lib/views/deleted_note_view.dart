import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/delete_notes_cubit/notes_deleted_cubit.dart';
import 'package:notes_app/cubits/note_cubit/note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/note_item.dart';

class DeletedNoteView extends StatelessWidget {
  const DeletedNoteView({super.key});
  static String id = 'DeletedNoteView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DeletedNoteViewBody(),
    );
  }
}

class DeletedNoteViewBody extends StatefulWidget {
  const DeletedNoteViewBody({super.key});

  @override
  State<DeletedNoteViewBody> createState() => _DeletedNoteViewBodyState();
}

class _DeletedNoteViewBodyState extends State<DeletedNoteViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesDeletedCubit>(context)
        .fetchAllNotesDeleted(); //مجرد بحضرها علشان هسخدمها
    // بدي لل all note قيمه في الاول
    // لما استدعي الفانكشن
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesDeletedCubit, NotesDeletedState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesDeletedCubit>(context).allDeletedNotes ??
                []; //جبتهم و خدت قيمتها
        return Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              CustomAppBar(
                name: 'Deleted Notes',
                icon: Icons.check,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                child: NotesDeletedListView(notes: notes),
              ),
              SizedBox(
                height: 65,
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: CustomButton(
                    buttonName: 'Delete All',
                    onPressed: () {
                      BlocProvider.of<NotesDeletedCubit>(context)
                          .emptyDeletedNotes();
                      BlocProvider.of<NotesDeletedCubit>(context)
                          .fetchAllNotesDeleted();
                    },
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class NotesDeletedListView extends StatelessWidget {
  const NotesDeletedListView({
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
        pushPadgName: EditNoteView.id,
        icon: FontAwesomeIcons.rotateRight,
        onPressed: () {
          NoteModel addNote = NoteModel(
              title: notes[index].title,
              subTitle: notes[index].subTitle,
              date: notes[index].date,
              color: notes[index].color);

          notes[index].delete();

          BlocProvider.of<NotesDeletedCubit>(context).fetchAllNotesDeleted();

          BlocProvider.of<AddNoteCubit>(context).addNote(addNote);

          BlocProvider.of<NoteCubit>(context).fetchAllNotes();

          //becuse noteModel extend from HiveObject
        },
        note: notes[index],
      ),
    );
  }
}
