import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    this.title,
    this.optionWidgets,
  });

  final String? title;
  final List<Widget>? optionWidgets;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(left: 2),
        child: title != null
            ? Text(title!, style: Theme.of(context).textTheme.titleMedium) // Display title if provided
            : Image.asset('assets/logo-with-color.png', height: 40), // Hardcoded fallback image
      ),
      actions: optionWidgets,
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      foregroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
