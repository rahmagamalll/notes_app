part of 'notes_deleted_cubit.dart';

@immutable
sealed class NotesDeletedState {}

final class NotesDeletedInitial extends NotesDeletedState {}

final class NotesDeletedSuccess extends NotesDeletedState {}
