import 'package:flutter/material.dart';
import 'package:notes_app/widgets/build_show_bottom_sheet.dart';

class CustomeFloatingActionBotton extends StatelessWidget {
  const CustomeFloatingActionBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Color(0xff141414),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          ),
          context: context,
          builder: (context) {
            return BuildShowBottomSheet();
          },
        );
      },
      backgroundColor: Colors.cyan,
      child: Icon(Icons.add),
    );
  }
}
