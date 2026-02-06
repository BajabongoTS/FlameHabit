import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 24, 26),
      body: Center(
        child: Text(
          'Calendar Page',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}