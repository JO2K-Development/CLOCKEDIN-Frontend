import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/dimentions.dart';
import 'package:flutter_app/core/widgets/my_divider.dart';

class DividerWithText extends StatelessWidget {
  final Widget child;

  const DividerWithText({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    const double dividerGaps = Dimentions.sizeM;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: dividerGaps),
      child: Row(
        children: [
          Flexible(
            child: MyDivider(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: dividerGaps),
            child: child,
          ),
          Flexible(
            child: MyDivider(),
          ),
        ],
      ),
    );
  }
}
