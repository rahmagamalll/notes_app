import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_states.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    this.onPressed,
    required this.buttonName,
    super.key,
  });
  final VoidCallback? onPressed;
  final String? buttonName;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteCubit, AddNoteStates>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.cyan,
            fixedSize: const Size(380, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: state is AddNoteLoading 
              ? SizedBox(
                  height: 15,
                  width: 15,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                )
              : Text(
                  buttonName!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
        );
      },
    );
  }
}
