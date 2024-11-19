import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/dimentions.dart';
import 'package:provider/provider.dart';

class MyButtonShort extends StatelessWidget {
  const MyButtonShort({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;
  static const double minWidth = Dimentions.shortButtonDefaultWidth;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: minWidth,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(minWidth, Dimentions.shortButtonHeight),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimentions.sizeM),
          child: Text(
            text,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).scaffoldBackgroundColor,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
