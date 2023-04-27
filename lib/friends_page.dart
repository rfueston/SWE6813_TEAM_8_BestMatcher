import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'friends_list.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'friends_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class FriendsPage extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.friends.isEmpty) {
      return Center(
        child: Text('No friends yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You Have Friends?'),
        ),
        for (var friend in appState.friends)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(friend),
          ),
      ],
    );
    //
    // Container(
    //   child: StreamBuilder(
    //     stream: FirebaseFirestore.instance.collection('users').limit(_limit).snapshots(),
    //     builder: (context, snapshot) {
    //       if (!snapshot.hasData) {
    //         return Center(
    //           child: CircularProgressIndicator( valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
    //           ),
    //         );
    //       }
    //     },
    //   ),
    // );


  }
}
