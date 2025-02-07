import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/dimentions.dart';
import 'package:flutter_gap/flutter_gap.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  final Widget? rightWidget;
  final String? description;
  final List<String>? bulletPoints;
  const SectionTitle(this.text, {super.key, this.rightWidget, this.description, this.bulletPoints});

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
                    description != null ? Padding(
                      padding: const EdgeInsets.only(left: Dimentions.sizeS, top: Dimentions.sizeS),
                      child: Text(description!, style: Theme.of(context).textTheme.labelMedium,),
                    ) : Container(),
                    
                    bulletPoints != null ? Builder(builder: (context) {
                      List<Widget> bulletWidgets = [];
                      for (var element in bulletPoints!) {
                        bulletWidgets.add(Padding(
                        padding: const EdgeInsets.only(left: Dimentions.sizeS, top: Dimentions.sizeS),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Icon(Icons.arrow_forward_ios, color: Theme.of(context).shadowColor, size: Dimentions.sizeM,)),
                            Flexible(child: Text(element, style: Theme.of(context).textTheme.labelMedium,)),
                          ],
                        ),
                      ));
                      }
                      return Column(
                        children: [
                          ...bulletWidgets
                        ],
                      );
                    }
                    ) : Container(),
                    
                    
                    Gap(Dimentions.sizeM),
                  ],
                ),
              );
  }
}