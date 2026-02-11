import 'package:flamehabit/theme/theme_provider.dart';
import 'package:flamehabit/database/habit_database.dart';
import 'package:flutter/material.dart';
import 'package:flamehabit/pages/calendar_page.dart';
import 'package:flamehabit/pages/home_page.dart';
import 'package:flamehabit/pages/settings_page.dart';
import 'package:flamehabit/pages/streak_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HabitDatabase.initialize();
  await HabitDatabase().saveFirstLaunchDate();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => HabitDatabase()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/homepage': (context) => HomePage(),
        '/calendarpage': (context) => CalendarPage(),
        '/streakpage': (context) => StreakPage(),
        '/settingspage': (context) => SettingsPage(),
      },
    );
  }
}
