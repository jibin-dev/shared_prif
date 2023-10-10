import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_pref/home.dart';
import 'package:shared_pref/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:shared_prefrence_sample/splash_scren.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: splash_scren(),
  ));
}

class splash_scren extends StatefulWidget {
  const splash_scren({super.key});

  @override
  State<splash_scren> createState() => splash_screnState();
}

class splash_screnState extends State<splash_scren> {
  static const String KEYLOGIN = 'login';
  @override
  void initState() {
    super.initState();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 220, 140, 69),
      body: Center(
        child: Text(
          'SHARED PREF',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void whereToGo() async {
    var sharePref = await SharedPreferences.getInstance();
    var isLogged = sharePref.getBool(KEYLOGIN);

    Timer(Duration(seconds: 2), () {
      if (isLogged != null) {
        if (isLogged) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => home(),
              ));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => login(),
              ));
        }
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => login(),
            ));
      }
    });
  }
}