import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';

// ignore: must_be_immutable
class NoteItem extends StatelessWidget {
  NoteItem(
      {super.key,
      required this.note,
     required  this.pushPadgName,
      required this.onPressed, required this.icon});
  final NoteModel note;
  String? pushPadgName;
  Function() onPressed;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, pushPadgName!, arguments: note);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        padding: EdgeInsets.only(right: 16),
        height: 160,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(note.color),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Padding(
                padding: EdgeInsets.only(bottom: 5, top: 3),
                child: Text(
                  note.title,
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  note.subTitle,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5), fontSize: 18),
                ),
              ),
              trailing: IconButton(
                onPressed: onPressed,
                icon: Icon(icon),
                color: Colors.black,
              ),
            ),
            Text(
              note.date,
              style:
                  TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
