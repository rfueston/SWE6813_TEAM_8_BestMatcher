import 'dart:developer';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _MyloginPageState();
}

class _MyloginPageState extends State<LoginPage> {

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  void _logIn() {
    showDialog(context: context, barrierDismissible: false,
        builder: (context)=> Center(child: CircularProgressIndicator()));
    setState(() async {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const MyApp()),
        // );
      // log("User Name: ${userNameController.text}, Password: ${passwordController.text}");
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: userNameController.text.trim(),
            password: passwordController.text.trim());
      }on FirebaseAuthException catch (e){
        print(e);
      }
      navigatorKey.currentState!.popUntil((route)=> route.isFirst);
    });
  }

  void _createAccount() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyAppAccountPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("BestMatcher"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             TextField(
              controller: userNameController,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'USERNAME',
              ),
            ),
             TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'PASSWORD',
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(100, 40),
                maximumSize: Size(300, 40),
              ),
              onPressed: _logIn,
              child: const Icon(Icons.login),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(100, 40),
                maximumSize: Size(300, 40),
              ),
              onPressed: _createAccount,
              child: const Icon(Icons.account_box),
            ),
          ],
        ),
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}