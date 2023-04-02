import 'dart:developer';

import 'package:english_words/english_words.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    log("Email : " + user!.email!);
    return Scaffold(
        body: Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome, ' + user!.email!),
            Text('News will go here!'),
            ElevatedButton.icon(
              icon: Icon(Icons.arrow_back, size: 32),
              onPressed: () => FirebaseAuth.instance.signOut(),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(100, 40),
                maximumSize: Size(300, 40),
              ),
              label: Text("Sign Out", style: TextStyle(fontSize: 24)),
            ),
          ]),
    ));
  }
}
