import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/theme/my_input_decoration_themes.dart';

class PlainTextIntputDecorationWrapper extends StatelessWidget {
  final Widget child;
  const PlainTextIntputDecorationWrapper(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(data: Theme.of(context).copyWith(
      inputDecorationTheme: MyInputDecorationThemes.plainInputDecorationTheme,
    ), child: child);
  }
}