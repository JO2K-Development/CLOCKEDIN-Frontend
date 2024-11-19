import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/dimentions.dart';

class MyBeveledContainer extends StatelessWidget {
  final Widget? child;
  final double radius;
  final bool isBackGPrimary;
  final Color? customColor;

  const MyBeveledContainer({required this.child, this.radius = Dimentions.sizeXXL, this.isBackGPrimary = false, this.customColor, super.key});

  @override
  Widget build(BuildContext context) {
    Color bgColor = Theme.of(context).scaffoldBackgroundColor;
    if (customColor != null) {
      bgColor = customColor!;
    } else if (isBackGPrimary) {
      bgColor = Theme.of(context).primaryColor;
    }

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
          // BoxShadow(
          //   color: Theme.of(context).shadowColor,
          //   spreadRadius: 1,
          //   blurRadius: 5,
          //   offset: Offset(0, 3), // changes position of shadow
          // ),
        ],
        color: bgColor,
        // border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        child: child)
      
    );
  }
}