import 'package:flutter/material.dart';

class CustomTextFormFild extends StatelessWidget {
 const  CustomTextFormFild(
      {super.key,
      this.hintText,
      this.onChanged,
      this.obscureText = false,
      this.maxLines,  this.controller});
  final Function(String)? onChanged;
  final String? hintText;
  final bool? obscureText;
  final int? maxLines;
  final TextEditingController? controller ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      validator: (value) {
        if (value!.isEmpty) {
          return '$hintText is required.';
        }
        return null;
      },
      cursorColor: Colors.cyan,
      maxLines: maxLines,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 14),
        errorStyle: const TextStyle(fontSize: 12, color: Colors.red),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.cyan, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }
}