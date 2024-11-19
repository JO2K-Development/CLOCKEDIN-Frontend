import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/app_colors.dart';
import 'package:flutter_app/core/utils/constants/dimentions.dart';
import 'package:flutter_app/core/widgets/my_beveled_container.dart';
import 'package:flutter_app/features/common/clock_in_out/controller/my_time_counter_provider.dart';
import 'package:provider/provider.dart';

class MyTimeCounter extends StatelessWidget {
  const MyTimeCounter({super.key});

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<MyTimeCounterProvider>(context);
    final elapsedSeconds = timerProvider.elapsedSeconds;

    String _formatTime(int seconds) {
      int minutes = seconds ~/ 60;
      final int hours = minutes ~/ 60;
      minutes %= 60;
      final int remainingSeconds = seconds % 60;
      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
    }

    return Center(
      child: FittedBox(
        child: Text(
          _formatTime(elapsedSeconds),
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: Dimentions.sizeXXL * 1.5, // Adjust size as needed
              color: Colors.grey,
              height: 0),
          textHeightBehavior: const TextHeightBehavior(
            applyHeightToFirstAscent: false,
            applyHeightToLastDescent: false,
          ),
        ),
      ),
    );
  }
}

class _wrapper extends StatelessWidget {
  final Widget child;

  const _wrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Background color for the container
        borderRadius: BorderRadius.circular(20), // Rounds the corners
        border: Border.all(
          color: Colors.black, // Outline color
          width: 1, // Outline thickness
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25), // Shadow color with opacity
            spreadRadius: 3, // How much the shadow spreads
            blurRadius: 15, // Blurring of the shadow
            offset: Offset(4, 4), // Shadow position offset
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 10.0), // Optional padding inside the border
        child: child, // Replace with your actual widget
      ),
    );
  }
}
