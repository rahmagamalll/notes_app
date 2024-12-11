class AddNoteStates {}

class AddNoteInitial extends AddNoteStates {}

class AddNoteLoading extends AddNoteStates {}

class AddNoteSuccess extends AddNoteStates {}

class AddNoteFailuer extends AddNoteStates {
  String errMessage;
  AddNoteFailuer(this.errMessage);
}
