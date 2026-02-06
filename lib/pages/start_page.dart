import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 24, 24, 26),
            title: Text('F L A M E H A B I T'),
            foregroundColor: Colors.white,
          ),
          backgroundColor: Color.fromARGB(255, 24, 24, 26),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/flame.json',
                width: 200,
                height: 200,
                repeat: true,
              ),
              SizedBox(height: 40),
              Text(
                'FlameHabit',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Light your daily habits, ignite your life',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 206, 206, 206),
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 24, 24, 26),
          child: Column(
            children: [
              DrawerHeader(
                child: Icon(Icons.person, color: Colors.white),
              ),

              ListTile(
                leading: Icon(Icons.home, color: Colors.white),
                title: Text('H O M E', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/homepage');
                },
              ),

              ListTile(
                leading: Icon(Icons.settings, color: Colors.white),
                title: Text('S E T T I N G S', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/settingspage');
                },
              ),
            ],
          ),
        ), 
      ),
    );  
  }
}