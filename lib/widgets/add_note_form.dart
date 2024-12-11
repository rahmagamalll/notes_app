import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/note_cubit/note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list_view.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_form_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          CustomTextFormFild(
            onChanged: (data) => title = data,
            hintText: 'Title',
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextFormFild(
            onChanged: (data) => content = data,
            hintText: 'Content',
            maxLines: 5,
          ),
          SizedBox(
            height: 10,
          ),
          ColorListView(),
          SizedBox(
            height: 10,
          ),
          CustomButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                var dateTime = DateTime.now();
                var formattedDate = DateFormat('yMMMd').format(dateTime);
                NoteModel noteModel = NoteModel(
                    title: title!,
                    subTitle: content!,
                    date: formattedDate,
                    color: Colors.blue.value);
                BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);

                BlocProvider.of<NoteCubit>(context)
                    .fetchAllNotes(); 

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Note added successfully!'),
                  ),
                );
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
            buttonName: 'Add',
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
