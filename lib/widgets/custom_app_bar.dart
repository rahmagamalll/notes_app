import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.name, this.icon, this.onPressed});
  final String? name;
  final IconData? icon;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 12),
      child: Row(
        children: [
          Text(
            name!,
            style: TextStyle(fontSize: 28),
          ),
          const Spacer(
            flex: 1,
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: IconButton(
              icon: Icon(
                icon,
                size: 25,
                color: Colors.white,
              ),
              onPressed: onPressed,
            ),
          )
        ],
      ),
    );
  }
}
