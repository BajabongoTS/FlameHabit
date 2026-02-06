import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}