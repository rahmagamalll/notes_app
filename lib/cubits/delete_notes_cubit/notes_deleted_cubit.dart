import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_deleted_state.dart';

class NotesDeletedCubit extends Cubit<NotesDeletedState> {
  NotesDeletedCubit() : super(NotesDeletedInitial());

  List<NoteModel>? allDeletedNotes;

  fetchAllNotesDeleted() {
    var noteBox = Hive.box<NoteModel>(kDeletedNotesHiveBox);

    allDeletedNotes = noteBox.values.toList();

    emit(NotesDeletedSuccess());
  }


  void emptyDeletedNotes() {
    var notesBox = Hive.box<NoteModel>(kDeletedNotesHiveBox);
    notesBox.deleteAll(notesBox.keys);
    emit(NotesDeletedSuccess());
  }
}
