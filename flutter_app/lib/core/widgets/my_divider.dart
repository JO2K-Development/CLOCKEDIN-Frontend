import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/dimentions.dart';

class MyDivider extends StatelessWidget {
  final double indentPercent;
  const MyDivider({super.key, this.indentPercent = Dimentions.defaulftDividerIndentProportion});

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