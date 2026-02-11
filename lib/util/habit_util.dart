import 'package:flamehabit/models/habit.dart';

bool isHabitCompletedToday(List<DateTime> completedDays) {
  final today = DateTime.now();
  return completedDays.any((date) {
    return date.toLocal().year == today.year &&
        date.toLocal().month == today.month &&
        date.toLocal().day == today.day;
  });
}

bool isAllHabitsCompleted(DateTime date, List<Habit> habits) {
  if (habits.isEmpty) return false;

  return habits.every((habit) {
    return habit.completedDays.any(
      (d) => d.year == date.year && d.month == date.month && d.day == date.day,
    );
  });
}

Map<DateTime, int> prepareHeatMapDataset(List<Habit> habits) {
  Map<DateTime, int> dataset = {};

  for (var habit in habits) {
    for (var date in habit.completedDays) {
      final normalizedDate = DateTime(date.year, date.month, date.day);

      if (dataset.containsKey(normalizedDate)) {
        dataset[normalizedDate] = dataset[normalizedDate]! + 1;
      } else {
        dataset[normalizedDate] = 1;
      }
    }
  }

  return dataset;
}
