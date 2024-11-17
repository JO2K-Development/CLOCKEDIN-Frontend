import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/services/network_handler.dart';

class MyTimeCounterProvider with ChangeNotifier {
  Timer? _timer;
  int _elapsedSeconds = 0;
  DateTime? _startTime;

  int get elapsedSeconds => _elapsedSeconds;

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _elapsedSeconds++;
      notifyListeners();
    });
    _startTime = DateTime.now();
  }

  void resetTimer() async {
    // await sendToDb();
    _timer?.cancel();
    _timer = null;
    _elapsedSeconds = 0;
    notifyListeners();
  }

  void switchTimer() {
    if (_timer == null) {
      startTimer();
    } else {
      resetTimer();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  
  Future<void> sendToDb() async {
    var body = {
      'endTime': DateTime.now(),
      'elapsedSeconds': _elapsedSeconds
    };
    String endPoint = '/api/user/switch-work-status';
    await NetworkHandler.post(body, endPoint);
  }

  
}
