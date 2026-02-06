import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flamehabit/pages/home_page.dart';
import 'package:flamehabit/pages/calendar_page.dart';
import 'package:flamehabit/pages/settings_page.dart';
import 'package:flamehabit/pages/streak_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    HomePage(),
    CalendarPage(),
    SettingsPage(),
    StreakPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
      color: Color.fromARGB(255, 15, 15, 15),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: GNav(
          selectedIndex: _selectedIndex,
          onTabChange: _navigateBottomBar,
          backgroundColor: const Color.fromARGB(255, 15, 15, 15),
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.grey.shade800,
          gap: 8,
          padding: EdgeInsets.all(16),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home'
            ),
            GButton(
              icon: Icons.calendar_today,
              text: 'Calendar'
            ),
            GButton(
              icon: Icons.whatshot,
              text: 'Strick'
            ),
            GButton(
              icon: Icons.settings,
              text: 'Settings'
            ),
          ],
        ),
       ),
      ),       
        // drawer: Drawer(
        //   backgroundColor: Color.fromARGB(255, 24, 24, 26),
        //   child: Column(
        //     children: [
        //       DrawerHeader(
        //         child: Icon(Icons.person, color: Colors.white),
        //       ),

        //       ListTile(
        //         leading: Icon(Icons.home, color: Colors.white),
        //         title: Text('H O M E', style: TextStyle(color: Colors.white)),
        //         onTap: () {
        //           Navigator.pop(context);
        //           Navigator.pushNamed(context, '/homepage');
        //         },
        //       ),

        //       ListTile(
        //         leading: Icon(Icons.settings, color: Colors.white),
        //         title: Text('S E T T I N G S', style: TextStyle(color: Colors.white)),
        //         onTap: () {
        //           Navigator.pop(context);
        //           Navigator.pushNamed(context, '/settingspage');
        //         },
        //       ),
        //     ],
        //   ),
        // ), 
      ),
    );  
  }
}