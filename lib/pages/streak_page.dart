import 'package:flamehabit/components/my_drawer.dart';
import 'package:flamehabit/database/habit_database.dart';
import 'package:flamehabit/models/habit.dart';
import 'package:flamehabit/util/habit_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreakPage extends StatefulWidget {
  const StreakPage({super.key});

  @override
  State<StreakPage> createState() => _StreakPageState();
}

class _StreakPageState extends State<StreakPage> {
  DateTime _currentWeekStartDate = DateTime.now().subtract(
    Duration(days: DateTime.now().weekday - 1),
  );

  void _previousWeek() {
    setState(() {
      _currentWeekStartDate = _currentWeekStartDate.subtract(
        const Duration(days: 7),
      );
    });
  }

  void _nextWeek() {
    setState(() {
      _currentWeekStartDate = _currentWeekStartDate.add(
        const Duration(days: 7),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final habitDatabase = context.watch<HabitDatabase>();
    List<Habit> currentHabits = habitDatabase.currentHabits;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          "Streak",
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          // Weekly Navigation
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: _previousWeek,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                Text(
                  "${_currentWeekStartDate.day}/${_currentWeekStartDate.month} - ${_currentWeekStartDate.add(const Duration(days: 6)).day}/${_currentWeekStartDate.add(const Duration(days: 6)).month}",
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: _nextWeek,
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ],
            ),
          ),

          // Streak Table
          Expanded(
            child: ListView.builder(
              itemCount: 7,
              itemBuilder: (context, index) {
                final isDarkMode =
                    Theme.of(context).brightness == Brightness.dark;
                final day = _currentWeekStartDate.add(Duration(days: index));
                final dayName = [
                  "Monday",
                  "Tuesday",
                  "Wednesday",
                  "Thursday",
                  "Friday",
                  "Saturday",
                  "Sunday",
                ][index];
                final bool isFuture = day.isAfter(DateTime.now());
                final bool isAllCompleted =
                    !isFuture && isAllHabitsCompleted(day, currentHabits);
                final bool isToday =
                    day.year == DateTime.now().year &&
                    day.month == DateTime.now().month &&
                    day.day == DateTime.now().day;

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                    vertical: 10,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isToday
                          ? Theme.of(context).colorScheme.secondary
                          : (isDarkMode
                                ? Colors.grey.shade900
                                : Theme.of(context).colorScheme.primary),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Day Name and Date
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dayName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isDarkMode
                                    ? Colors.white
                                    : Theme.of(
                                        context,
                                      ).colorScheme.inversePrimary,
                              ),
                            ),
                            Text(
                              "${day.day}/${day.month}/${day.year}",
                              style: TextStyle(
                                color: isDarkMode
                                    ? Colors.white
                                    : Theme.of(
                                        context,
                                      ).colorScheme.inversePrimary,
                              ),
                            ),
                          ],
                        ),

                        // Status Icon
                        if (isFuture)
                          Icon(
                            Icons.horizontal_rule,
                            color: isDarkMode
                                ? Colors.white
                                : Theme.of(context).colorScheme.inversePrimary,
                          )
                        else if (isAllCompleted)
                          const Icon(
                            Icons.local_fire_department,
                            color: Colors.orange,
                          )
                        else
                          const Icon(
                            Icons.block,
                            color: Color.fromARGB(255, 63, 63, 63),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
