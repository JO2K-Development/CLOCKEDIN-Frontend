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
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: title != null
            ? Text(title!, style: Theme.of(context).textTheme.titleMedium) // Display title if provided
            : Image.asset('./assets/images/logos/logo-with-color.png', height: 25), // Hardcoded fallback image
      ),
      actions: optionWidgets,
      elevation: 0,
      
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      // foregroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
