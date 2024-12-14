import 'package:flutter/material.dart';
import 'package:flutter_app/core/models/StatisticsDict';
import 'package:flutter_app/core/models/work_cycle.dart';
import 'package:flutter_app/core/utils/constants/dimentions.dart';
import 'package:flutter_app/core/widgets/my_app_bar.dart';
import 'package:flutter_app/core/widgets/my_beveled_container.dart';
import 'package:flutter_app/core/widgets/my_divider.dart';
import 'package:flutter_app/core/widgets/statistics_list.dart';
import 'package:flutter_app/core/widgets/work_cycles_scrollable_list.dart';
import 'package:flutter_app/features/emplyee/calendar/controller/calendar_provider.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class DayOfWork extends StatelessWidget {
  final List<WorkCycle> workCycles;
  final StatisticsDict statisticsDict; 
  const DayOfWork(this.workCycles, this.statisticsDict, {super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: MyAppBar(
        // title: DateFormat("EEE yyyy-MM-dd",Localizations.localeOf(context).toString()).format(DateTime.now()),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              Gap(Dimentions.sizeM),
              Text(DateFormat("EEE yyyy-MM-dd",Localizations.localeOf(context).toString()).format(DateTime.now()), style: Theme.of(context).textTheme.titleMedium,),
              MyDivider(),
              Padding(
                padding: const EdgeInsets.all(Dimentions.sizeXS),
                child: WorkCyclesScrollableList<CalendarProvider>(workCyclesOverwrite: workCycles, scrollable: false, isTopGap: false),
              ),
              Padding(
                padding: const EdgeInsets.all(Dimentions.sizeXL),
                child: Align(              
                  alignment: Alignment.centerLeft,
                  child: Text(AppLocalizations.of(context).calendar_statistics, style: Theme.of(context).textTheme.titleLarge,)),
              ),
              StatisticsList(statisticsDict),
            ],
          ),
        ),
      ),
    );
  }
}