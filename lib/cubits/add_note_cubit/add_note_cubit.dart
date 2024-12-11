import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_states.dart';
import 'package:notes_app/models/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteStates> {
  AddNoteCubit() : super((AddNoteInitial()));

  Color color = Color(0xffa0e7e5); //defult color

  addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      var noteBox = Hive.box<NoteModel>(kNotesHiveBox);
      await noteBox.add(note);

      note.color = color.value; //defult color

      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailuer(e.toString()));
    }
  }
}
