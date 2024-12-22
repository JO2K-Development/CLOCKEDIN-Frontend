import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/dimentions.dart';
import 'package:flutter_gap/flutter_gap.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  final Widget? rightWidget;
  final String? description;
  const SectionTitle(this.text, {super.key, this.rightWidget, this.description});

  @override
  Widget build(BuildContext context) {
    var title = rightWidget != null ?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(text, style: Theme.of(context).textTheme.titleMedium,),
                      rightWidget!,
                    ],
                  )
                : Align(              
                  alignment: Alignment.centerLeft,
                  child: Text(text, style: Theme.of(context).textTheme.titleMedium,));
    return Padding(
                padding: const EdgeInsets.all(Dimentions.sizeXL),
                child: Column(
                  children: [
                    title,
                    Gap(Dimentions.sizeS),
                    description != null ? Padding(
                      padding: const EdgeInsets.only(left: Dimentions.sizeS),
                      child: Text(description!, style: Theme.of(context).textTheme.labelMedium,),
                    ) : Container(),
                    Gap(Dimentions.sizeM),
                  ],
                ),
              );
  }
}