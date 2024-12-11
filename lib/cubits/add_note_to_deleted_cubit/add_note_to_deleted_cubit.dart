import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_to_deleted_state.dart';

class AddNoteToDeletedCubit extends Cubit<AddNoteToDeletedState> {
  AddNoteToDeletedCubit() : super(AddNoteToDeletedInitial());

  Color color = Color(0xffa0e7e5); //defult color

  addNoteToDelete(NoteModel note) async {
    emit(AddNoteToDeletedLoading());
    try {
      var noteBox = Hive.box<NoteModel>(kDeletedNotesHiveBox);
      await noteBox.add(note);
      
      note.color = color.value; //defult color


      emit(AddNoteToDeletedSuccess());
    } catch (e) {
      emit(AddNoteToDeletedFailuer(e.toString()));
      print('error ================= ${e.toString()}');
    }
  }
}
