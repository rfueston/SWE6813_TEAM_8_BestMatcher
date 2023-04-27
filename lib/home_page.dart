import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_words/english_words.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO: implement FireBase auth lib instead of custom
    final user = FirebaseAuth.instance.currentUser;

    // log("Email : " + user!.email!);
    return Scaffold(
        body: Center(
      //   //TODO: add new stream method
      //   child: const Text('News will go here!'),
      // ),
      //   );
      // }
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //TODO: implement FireBase auth lib instead of custom
            Text('Welcome, ${user?.email},'),
            Text('Have a Great Time match making'),
            Text('\n'),
            Text('News: First version of the app live!'),
          ]),
    ));
  }
}
