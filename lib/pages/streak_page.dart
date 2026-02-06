import 'package:flutter/material.dart';

class StreakPage extends StatelessWidget {
  const StreakPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 24, 26),
      body: Center(
        child: Text(
          'Streak Page',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}