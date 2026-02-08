import 'package:flamehabit/theme/theme_provider.dart';
import 'package:flamehabit/database/habit_database.dart';
import 'package:flutter/material.dart';
import 'package:flamehabit/pages/start_page.dart';
import 'package:flamehabit/pages/home_page.dart';
import 'package:flamehabit/pages/settings_page.dart';
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
      home: StartPage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/startpage': (context) => StartPage(),
        '/homepage': (context) => HomePage(),
        '/settingspage': (context) => SettingsPage(),
      },
    );
  }
}
