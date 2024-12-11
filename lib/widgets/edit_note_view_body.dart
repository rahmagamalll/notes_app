import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/delete_notes_cubit/notes_deleted_cubit.dart';
import 'package:notes_app/cubits/note_cubit/note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_form_field.dart';
import 'package:notes_app/widgets/edit_colors_list_view.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, subTitel; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          CustomAppBar(
            name: 'Edit',
            icon: Icons.check,
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = subTitel ?? widget.note.subTitle;
              BlocProvider.of<NoteCubit>(context).fetchAllNotes();
              BlocProvider.of<NotesDeletedCubit>(context)
                  .fetchAllNotesDeleted();

              Navigator.pop(context);
            },
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextFormFild(
            hintText: 'Title',
            controller: TextEditingController(text: widget.note.title),
            onChanged: (data) {
              title = data;
            },
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextFormFild(
            controller: TextEditingController(text: widget.note.subTitle),
            onChanged: (data) {
              subTitel = data;
            },
            hintText: 'Content',
            maxLines: 5,
          ),
          SizedBox(
            height: 20,
          ),
          EditColorsListView(
            note: widget.note,
          )
        ],
      ),
    );
  }
}
