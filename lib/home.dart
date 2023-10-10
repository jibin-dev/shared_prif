import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Center(
        child: Column(
          children: [
            Text('Welcome User'),
            ElevatedButton(onPressed: () {}, child: Text('Log out'))
          ],
        ),
      ),
    );
  }
}