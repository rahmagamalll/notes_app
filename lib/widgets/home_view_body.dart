import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/note_cubit/note_cubit.dart';
import 'package:notes_app/cubits/note_cubit/note_states.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/deleted_note_view.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/notes_list_view.dart';


class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    BlocProvider.of<NoteCubit>(context)
        .fetchAllNotes(); 
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteStates>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NoteCubit>(context).allNotes ??
            []; 
        return Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              CustomAppBar(
                name: 'Notes',
                icon: Icons.delete_sweep,
                onPressed: () {
                  Navigator.pushNamed(context, DeletedNoteView.id);
                },
              ),
              Expanded(
                child: NotesListView(notes: notes),
              ),
            ],
          ),
        );
      },
    );
  }
}

