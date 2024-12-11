part of 'add_note_to_deleted_cubit.dart';

@immutable
sealed class AddNoteToDeletedState {}

final class AddNoteToDeletedInitial extends AddNoteToDeletedState {}

class AddNoteToDeletedLoading extends AddNoteToDeletedState {}

class AddNoteToDeletedSuccess extends AddNoteToDeletedState {}

// ignore: must_be_immutable
class AddNoteToDeletedFailuer extends AddNoteToDeletedState {
  String errMessage;
  AddNoteToDeletedFailuer(this.errMessage);
}