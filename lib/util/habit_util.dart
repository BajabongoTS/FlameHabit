bool isHabitCompletedToday(List<DateTime> completedDays) {
  final today = DateTime.now();
  return completedDays.any((date) {
    return date.toLocal().year == today.year &&
        date.toLocal().month == today.month &&
        date.toLocal().day == today.day;
  });
}
