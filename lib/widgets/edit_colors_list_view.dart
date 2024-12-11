import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list_view.dart';

// ignore: must_be_immutable
class EditColorsListView extends StatefulWidget {
  EditColorsListView({super.key, required this.note});
 NoteModel note;
  @override
  State<EditColorsListView> createState() => _EditColorsListViewState();
}

class _EditColorsListViewState extends State<EditColorsListView> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = kColorsList.indexOf(Color(widget.note.color)); //last color
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25 * 2,
      child: Padding(
        padding: const EdgeInsets.only(left: 48),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: kColorsList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GestureDetector(
                onTap: () {
                  currentIndex = index; //new color
                  widget.note.color = kColorsList[index].value; // take color
                  setState(() {});
                },
                child: ColorItem(
                  color: kColorsList[index],
                  isActive: currentIndex == index,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
