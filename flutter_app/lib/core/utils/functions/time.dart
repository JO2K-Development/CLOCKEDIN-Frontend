class TimeUtils {
  static bool isDayInWorkCycle(DateTime day, DateTime startTime, DateTime endTime) {
      return startTime.subtract(Duration(days: 1)).isBefore(day) &&
          DateTime(endTime.year, endTime.month, endTime.day, 23, 59)
              .isAfter(day);
    }
}