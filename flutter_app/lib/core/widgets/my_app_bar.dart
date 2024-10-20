import 'package:flutter/material.dart';


class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.title, this.optionWidgets});
  final String title;
  final List<Widget>? optionWidgets;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Text(title, style: Theme.of(context).textTheme.titleMedium),
        ),
        // backgroundColor: AppColors.backgroundColor,
        actions: optionWidgets,
        // foregroundColor: AppColors.secondaryColor,
        elevation: 0,
      );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}