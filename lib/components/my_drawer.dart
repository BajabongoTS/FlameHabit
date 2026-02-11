import 'package:flamehabit/theme/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // Logo / Header
          DrawerHeader(
            child: Center(
              child: Lottie.asset(
                'assets/flame.json',
                repeat: true,
                width: 100,
                height: 100,
              ),
            ),
          ),

          // Home Tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 25),
            child: ListTile(
              title: Text("H O M E"),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/homepage');
              },
            ),
          ),

          // Calendar Tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 0),
            child: ListTile(
              title: Text("C A L E N D A R"),
              leading: const Icon(Icons.calendar_today),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/calendarpage');
              },
            ),
          ),

          // Streak Tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 0),
            child: ListTile(
              title: Text("S T R E A K"),
              leading: const Icon(Icons.local_fire_department),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/streakpage');
              },
            ),
          ),

          // Settings Tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 0),
            child: ListTile(
              title: Text("S E T T I N G S"),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/settingspage');
              },
            ),
          ),

          // Spacer to push dark mode switch to bottom
          const Spacer(),

          // Dark Mode Switch
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "DARK MODE",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                CupertinoSwitch(
                  value: Provider.of<ThemeProvider>(context).isDarkMode,
                  onChanged: (value) => Provider.of<ThemeProvider>(
                    context,
                    listen: false,
                  ).toggleTheme(),
                  activeColor: Colors.orange,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
