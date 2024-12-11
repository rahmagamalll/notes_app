import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_to_deleted_cubit/add_note_to_deleted_cubit.dart';
import 'package:notes_app/cubits/delete_notes_cubit/notes_deleted_cubit.dart';
import 'package:notes_app/cubits/note_cubit/note_cubit.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/deleted_note_view.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/views/home_view.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Bloc.observer = SimpleBlocObserver();

  Hive.registerAdapter<NoteModel>(NoteModelAdapter());
  

  await Hive.openBox<NoteModel>(kNotesHiveBox);

 await Hive.openBox<NoteModel>(kDeletedNotesHiveBox);



  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NoteCubit(),
        ),
        BlocProvider(
          create: (context) => AddNoteToDeletedCubit(),
        ),
        BlocProvider(
          create: (context) => AddNoteCubit(),
        ),
        BlocProvider(
          create: (context) => NotesDeletedCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeView.id: (context) => HomeView(),
          EditNoteView.id: (context) => EditNoteView(),
          DeletedNoteView.id: (context) => DeletedNoteView(),
        },
        theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
        initialRoute: HomeView.id,
      ),
    );
  }
}
