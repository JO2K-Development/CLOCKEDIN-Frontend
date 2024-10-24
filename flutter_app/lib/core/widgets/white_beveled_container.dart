import 'package:flutter/material.dart';

class WhiteBeveledContainer extends StatelessWidget {
  final Widget? widget;
  const WhiteBeveledContainer(this.widget, {super.key});

  @override
  Widget build(BuildContext context) {
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
        color: Theme.of(context).scaffoldBackgroundColor,
        // border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(50)),
        
      ),
      child: widget
      
    );
  }
}