import 'package:flutter/material.dart';

class MyAvatar extends StatelessWidget {
  late CircleAvatar circleAvatar;
  final double sizeDegree;
  late double radius;
  MyAvatar(String imgUrl, {Widget? fallback, this.sizeDegree=1.2, super.key}) {
    radius = 30 * sizeDegree; 
    circleAvatar = CircleAvatar(
      backgroundImage: NetworkImage(imgUrl),
      radius: radius,
      // child: fallback ?? Icon(Icons.person),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        circleAvatar,
        Positioned(
          bottom: 0,
          right: 0,
          child: InnerRingWidget(radius: radius,),
        ),
      ],
    );
  }
}

// GPT-3 generated code
class InnerRingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black.withAlpha(20) // Ring color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3; // Ring thickness

    final double radius = (size.width / 2) - (paint.strokeWidth / 2); // Ensure it's inside
    final Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class InnerRingWidget extends StatelessWidget {
  final double radius;
  InnerRingWidget({super.key, required this.radius});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(radius * 2, radius * 2), // Adjust size as needed
      painter: InnerRingPainter(),
    );
  }
}
