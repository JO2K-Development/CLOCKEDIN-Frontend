import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  final double indentPercent;
  const MyDivider({super.key, this.indentPercent = 0.0});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final indent = constraints.maxWidth * indentPercent/2;

        return 
        Divider(
        height: 0,
        color: Theme.of(context).dividerColor,        
        thickness: 1.0,
        indent: indent,
        endIndent: indent,
      );
      }
    );
  }
}