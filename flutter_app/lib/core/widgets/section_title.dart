import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/dimentions.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  final Widget? rightWidget;
  const SectionTitle(this.text, {super.key, this.rightWidget});

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.all(Dimentions.sizeXL),
                child: rightWidget != null ?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(text, style: Theme.of(context).textTheme.titleLarge,),
                      rightWidget!,
                    ],
                  )
                : Align(              
                  alignment: Alignment.centerLeft,
                  child: Text(text, style: Theme.of(context).textTheme.titleLarge,)),
              );
  }
}