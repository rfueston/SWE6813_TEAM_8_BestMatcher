import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home_page.dart';
import 'main.dart';
import 'package:provider/provider.dart';
import 'friends_page.dart';
import 'message_page.dart';


class FriendsListPage extends StatelessWidget {
  const FriendsListPage({super.key});

  final friendsTab = true;
  final chatsTab = true;

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(''),
          actions: <Widget>[
            const IconButton(
              onPressed: null,
              icon: Icon(Icons.undo_outlined),
            ),
            const IconButton(
              onPressed: null,
              icon: Icon(Icons.tune_outlined),
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.person_outline_sharp)),
              Tab(icon: Icon(Icons.chat)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            friendsTab == false ? Icon(Icons.person_outline_sharp, size: 350) : const MyFriends(),
            chatsTab == false ? Icon(Icons.chat, size: 350) : const MyChats(),
          ],
        ),
      ),
    );
  }
}

class MyFriends extends StatelessWidget {
  const MyFriends({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Friends',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        ),
        home: FriendsPage(),
      ),
    );
  }
}

class MyChats extends StatelessWidget {
  const MyChats({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Friends',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        ),
        home: MessagePage(),
      ),
    );
  }
}