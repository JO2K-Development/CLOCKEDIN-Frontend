import 'package:flutter/material.dart';

class MyTextIconButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const MyTextIconButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text),
          const SizedBox(width: 8.0), // Spacing between text and icon
          Icon(icon),
        ],
      ),
    );
  }
}
