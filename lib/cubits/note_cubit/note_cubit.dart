import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/note_cubit/note_states.dart';
import 'package:notes_app/models/note_model.dart';

class NoteCubit extends Cubit<NoteStates> {
  NoteCubit() : super(NoteInitial());

  List<NoteModel>? allNotes;

  fetchAllNotes() {
    var noteBox = Hive.box<NoteModel>(kNotesHiveBox);

    allNotes = noteBox.values.toList();

    emit(NoteSuccess());
  }
}
