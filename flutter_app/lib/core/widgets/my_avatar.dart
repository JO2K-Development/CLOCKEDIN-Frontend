import 'package:flutter/material.dart';

class MyAvatar extends StatelessWidget {
  final CircleAvatar circleAvatar;
  final int sizeDegree;
  MyAvatar(String imgUrl, {Widget? fallback, this.sizeDegree=1, super.key})
      : circleAvatar = CircleAvatar(
          backgroundImage: NetworkImage(imgUrl),
          radius: 30 * sizeDegree.toDouble(),
          // child: fallback ?? Icon(Icons.person),
        );

  @override
  Widget build(BuildContext context) {
    return circleAvatar;
  }
}