import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController myController = TextEditingController();

  String userName = '';

  void greetUser() {
    String name = myController.text;
    setState(() {
      userName = "Hello, $name";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0), 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(userName),
            TextField(
              controller: myController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your name',
              ),
            ),
            ElevatedButton(
              onPressed: greetUser, 
              child: Text("Submit"))
          ],
        ))
      ),
    );
  }
}