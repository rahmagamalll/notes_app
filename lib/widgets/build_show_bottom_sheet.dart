import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_states.dart';
import 'package:notes_app/cubits/note_cubit/note_cubit.dart';
import 'package:notes_app/widgets/add_note_form.dart';

class BuildShowBottomSheet extends StatelessWidget {
  const BuildShowBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: BlocListener<AddNoteCubit, AddNoteStates>(
          listener: (context, state) {
            if (state is AddNoteSuccess) {
              Navigator.pop(context);
              BlocProvider.of<NoteCubit>(context).fetchAllNotes(); 
             
            }
            if (state is AddNoteFailuer) {}
          },
          child: BlocBuilder<AddNoteCubit, AddNoteStates>(
            builder: (context, state) {
              return AbsorbPointer(
                absorbing: state is AddNoteLoading ? true : false,
                child: AddNoteForm(),
              );
            },
          ),
        ),
      ),
    );
  }
}
