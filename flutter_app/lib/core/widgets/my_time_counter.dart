import 'dart:async';
import 'package:flutter/material.dart';

class MyTimeCounter extends StatefulWidget {
  final DateTime? startTime; // Make startTime nullable

  const MyTimeCounter({Key? key, this.startTime}) : super(key: key);

  @override
  _MyTimeCounterState createState() => _MyTimeCounterState();
}

class _MyTimeCounterState extends State<MyTimeCounter> {
  late Timer _timer;
  late int _elapsedSeconds;
  late DateTime _startTime;

  @override
  void initState() {
    super.initState();
    _startTime = widget.startTime ?? DateTime.now(); // Initialize startTime
    _elapsedSeconds = DateTime.now().difference(_startTime).inSeconds;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedSeconds = DateTime.now().difference(_startTime).inSeconds;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Always cancel timers to prevent memory leaks
    super.dispose();
  }

  String _formatTime(int seconds) {
    final int minutes = seconds ~/ 60;
    final int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        _formatTime(_elapsedSeconds),
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          fontSize: 100,
        ),
      ),
    );
  }
}
