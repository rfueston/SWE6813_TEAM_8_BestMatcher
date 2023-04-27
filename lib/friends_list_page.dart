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


class FriendsListPage extends StatelessWidget {

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
          child: Text('You have friends:'),
        ),
        for (var friend in appState.friends)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(friend),
          ),
      ],
    );
  }
}