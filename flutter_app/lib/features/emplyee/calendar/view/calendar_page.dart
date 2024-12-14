import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/core/services/navigation_service.dart';
import 'package:flutter_app/core/utils/constants/dimentions.dart';
import 'package:flutter_app/core/widgets/my_beveled_container.dart';
import 'package:flutter_app/core/widgets/section_title.dart';
import 'package:flutter_app/core/widgets/statistics_list.dart';
import 'package:flutter_app/features/emplyee/calendar/controller/calendar_provider.dart';
import 'package:flutter_app/features/emplyee/calendar/view/day_of_work.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final weekendColor =
        Theme.of(context).colorScheme.secondary.withOpacity(0.3);
    var currentDay = DateTime.now();
    currentDay.add(Duration(days: 1));
    return Builder(builder: (context) {
      bool isLoading = Provider.of<CalendarProvider>(context).isLoading;
    
      if (isLoading) {
        return Center(child: CircularProgressIndicator());
      }
    
      return SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(Dimentions.sizeS),
              child: MyBeveledContainer(
                radius: 20,
                child: Padding(
                  padding: const EdgeInsets.all(Dimentions.sizeM),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TableCalendar(
                        firstDay: DateTime.utc(2023, 1, 1),
                        lastDay: DateTime.utc(2024, 12, 31),
                        focusedDay: currentDay,
                        startingDayOfWeek: StartingDayOfWeek.monday,
            
                        eventLoader: (day) =>
                            Provider.of<CalendarProvider>(context, listen: false)
                                .getEventsForDay(day),
                        onDaySelected: (selectedDay, focusedDay) {
                          print(selectedDay);
                          var workCyclesForDay =
                              Provider.of<CalendarProvider>(context, listen: false)
                                  .getEventsForDay(selectedDay);
                          // TODO: actually send the statistics for day not for the month
                          var statisticsDict = Provider.of<CalendarProvider>(context, listen: false).statisticsDict!;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                // Ensure that the provider is available in the new screen's context
                                return ChangeNotifierProvider.value(
                                  value: Provider.of<CalendarProvider>(context,
                                      listen: false),
                                  child: DayOfWork(workCyclesForDay, statisticsDict),
                                );
                              },
                            ),
                          );
                          print(workCyclesForDay.toString());
                        },
                        daysOfWeekHeight: 50,
                        calendarBuilders: CalendarBuilders(
                          markerBuilder: (context, day, events) {
                            if (events.isNotEmpty) {
                              return _buildEventsMarker(events, context);
                            }
                          },
                          todayBuilder: (context, day, focusedDay) {
                            return Container(
                              decoration: BoxDecoration(
                                gradient: RadialGradient(
                                  center:
                                      Alignment.center, // Center of the gradient
                                  radius:
                                      0.8, // Controls how far the gradient spreads
                                  colors: [
                                    Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.5),
                                    Theme.of(context).colorScheme.primary
                                  ], // Gradient colors
                                  stops: [0.6, 1.7], // Stops for the gradient colors
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              margin: const EdgeInsets.all(2.0),
                              alignment: Alignment.center,
                              child: Text(
                                day.day.toString(),
                                style: TextStyle(
                                    color: Theme.of(context).colorScheme.onPrimary),
                              ),
                            );
                          },
                          outsideBuilder:
                              _weekendColumnsBuilder(weekendColor, outside: true),
                          disabledBuilder:
                              _weekendColumnsBuilder(weekendColor, outside: true),
                          defaultBuilder: _weekendColumnsBuilder(weekendColor),
                          dowBuilder: (context, day) {
                            if ([DateTime.sunday, DateTime.saturday]
                                .contains(day.weekday)) {
                              final text = DateFormat.E().format(day);
                
                              return Container(
                                color: weekendColor,
                                child: Center(
                                  child: Text(
                                    text,
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SectionTitle(AppLocalizations.of(context).calendar_statistics),
            StatisticsList(Provider.of<CalendarProvider>(context).statisticsDict!),
          ],
        ),
      );
    });
  }

  Widget Function(BuildContext, DateTime, DateTime) _weekendColumnsBuilder(
      Color weekendColor,
      {bool outside = false}) {
    return (context, day, focusedDay) {
      if ([DateTime.sunday, DateTime.saturday].contains(day.weekday)) {
        return Container(
          color: weekendColor,
          child: Center(
            child: Text(
              day.day.toString(),
              style: TextStyle(
                color: !outside ? Theme.of(context).primaryColor : null,
              ),
            ),
          ),
        );
      }
      return Center(
        child: Text(
          day.day.toString(),
          style: TextStyle(
            color: !outside ? Theme.of(context).primaryColor : null,
          ),
        ),
      );
    };
  }
  
  _buildEventsMarker(List<Object?> events, BuildContext context) {
    return Container(
    width: 8.0,  // Size of the dot
    height: 8.0, // Size of the dot
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColor, // Dot color
      shape: BoxShape.circle, // Circular shape
    ),
  );
  }
}
