class TimeUtils {
  static bool dayWorkCycleOverlap(DateTime day, DateTime startTime, DateTime endTime) {
      DateTime lowerBound = DateTime(day.year, day.month, day.day, 0, 0);
      DateTime upperBound = DateTime(day.year, day.month, day.day, 23, 59);
      return (startTime.isBefore(upperBound) && endTime.isAfter(lowerBound)) || (endTime.isAfter(lowerBound) && startTime.isBefore(upperBound));
    }
}
