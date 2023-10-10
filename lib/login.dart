import 'package:flutter/material.dart';
import 'package:shared_pref/home.dart';
import 'package:shared_pref/main.dart';
import 'package:shared_preferences/shared_preferences.dart';


class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController _password = TextEditingController();
  TextEditingController _email = TextEditingController();
  late String email = _email.toString();
  late String password = _password.toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Log in')),
      body: Center(
        child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _password,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      var sharePref = await SharedPreferences.getInstance();
                      sharePref.setBool(splash_screnState.KEYLOGIN, true);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => home(),
                          ));

                      print(email);
                    },
                    child: Text('Log in'),
                  ),
                  TextButton(onPressed: () {}, child: Text('Sign Up'))
                ],
              ),
            )),
      ),
    );
  }
}