import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CallendarPage extends StatelessWidget {
  const CallendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      // firstDay: DateTime.utc(2023, 1, 1),
      // lastDay: DateTime.utc(2024, 12, 31),
      // focusedDay: DateTime.now(),
      
    );
  }
}