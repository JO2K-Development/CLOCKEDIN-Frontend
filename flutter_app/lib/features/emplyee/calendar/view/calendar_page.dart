import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/dimentions.dart';
import 'package:flutter_app/core/widgets/my_beveled_container.dart';
import 'package:flutter_app/features/emplyee/calendar/controller/calendar_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final weekendColor =
        Theme.of(context).colorScheme.secondary.withOpacity(0.3);
    var currentDay = DateTime.now();
    currentDay.add(Duration(days: 1));
    return ChangeNotifierProvider(
      create: (context) => CalendarProvider(),
      child: Padding(
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
                  eventLoader: (day) => Provider.of(context, listen: false)
                      .getEventsForDay(day),
                  daysOfWeekHeight: 50,
                  calendarBuilders: CalendarBuilders(
                    todayBuilder: (context, day, focusedDay) {
                      return Container(
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                            center: Alignment.center, // Center of the gradient
                            radius: 0.6, // Controls how far the gradient spreads
                            colors: [
                              Theme.of(context).colorScheme.primary.withOpacity(0.5),
                              Theme.of(context).colorScheme.primary
                            ], // Gradient colors
                            stops: [1, 1.7], // Stops for the gradient colors
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        margin: const EdgeInsets.all(4.0),
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
                              style: TextStyle(color: Theme.of(context).primaryColor),
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
    );
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
}
