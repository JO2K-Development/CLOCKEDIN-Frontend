import 'package:flutter/material.dart';
import 'package:flutter_app/core/models/StatisticsDict';
import 'package:flutter_app/core/models/work_cycle.dart';
import 'package:flutter_app/core/widgets/work_cycles_list.dart';
import 'package:flutter_app/features/emplyee/calendar/controller/calendar_provider.dart';

class DayOfWork extends StatelessWidget {
  final List<WorkCycle> workCycles;
  final StatisticsDict? statisticsDict; 
  const DayOfWork(this.workCycles, this.statisticsDict, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          WorkCyclesList<CalendarProvider>(workCyclesOver: workCycles),
          Text("TU bedą statystyki", style: Theme.of(context).textTheme.bodyMedium,),
        ],
      ),
    );
  }
}