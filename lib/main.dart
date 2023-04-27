import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'create_account_page.dart';
import 'questionnaire_page.dart';
import 'friends_list_page.dart';
import 'message_page.dart';
import 'match_making_page.dart';
import 'settings_page.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'friends_list.dart';
import 'dart:async';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyA5SgghyrvC1tZbdKS9l8BDd1J-s8GlaUk",
        authDomain: "swe6813-bestmatcher.firebaseapp.com",
        databaseURL: "https://swe6813-bestmatcher-default-rtdb.firebaseio.com",
        projectId: "swe6813-bestmatcher",
        storageBucket: "swe6813-bestmatcher.appspot.com",
        messagingSenderId: "565968558840",
        appId: "1:565968558840:web:cffa7ae9ddb68b9530390d",
        measurementId: "G-8T28GS8GW6"
    ),
  );
  runApp(MyAppLogin());
}
//TODO: use navigatorKey
final navigatorKey = GlobalKey<NavigatorState>();
class MyAppLogin extends StatelessWidget {
  const MyAppLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        //TODO: use navigatorKey
        navigatorKey: navigatorKey,
        title: 'BestMatcher',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        ),
          // home: LoginPage()
        //TODO: added user stream data
        home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Something went wrong'));
              } else if (snapshot.hasData) {
                log("Going to MyApp page");
                return MyApp();
              } else {
                log("Going back to login page");
                return LoginPage();
              }
            }),
      ),
    );
  }
}

class MyAppAccountPage extends StatelessWidget {
  const MyAppAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'BestMatcher',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        ),
        home: CreateAccountPage(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    var username = user?.email;
    final accountCollection =
    FirebaseFirestore.instance.collection('Accounts').doc(username);
    var data = null;
    accountCollection.get().then(
          (DocumentSnapshot doc) {
        data = doc.data() as Map<String, dynamic>;
        print('Data : ' + data['gdpr'].toString());
        if (data['gdpr'] == null || !data['gdpr']) {
          showDialog<void>(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Terms of use'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text(
                          'You accept to allow us to use the information shared in this application.'),
                      // Text('Would you like to approve of this message?'),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Accept'),
                    onPressed: () {
                      final data = <String, dynamic>{"gdpr": true};
                      FirebaseFirestore.instance
                          .collection('Accounts')
                          .doc(username)
                          .update(data);
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('Reject'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'BestMatcher',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        ),
        home: NavigationBar(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var friends = {'test user 2', 'test user 3', 'test user 4', 'test user 5', 'test user 6'};

//TODO: https://sweksu.atlassian.net/browse/WEB-33
// var friends = FriendsList().setFriendsList("sdu");


//TODO:update for news feed
}

class NavigationBar extends StatefulWidget {
  @override
  State<NavigationBar> createState() => MyHomePageState();
}

class MyHomePageState extends State<NavigationBar> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = HomePage();
        break;
      case 1:
        page = QuestionnairePage();
        break;
      case 2:
        page = FriendsListPage();
        break;
      case 3:
        page = MatchMakingPage();
        break;
      case 4:
        page = SettingsPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      final user = FirebaseAuth.instance.currentUser;
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'BestMatcher, Welcome ',
            style: TextStyle(color: Colors.deepPurpleAccent),
          ),
        ),
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600, // ← Here.
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home_outlined),
                    label: Text('home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.add_chart_rounded),
                    label: Text('questionnaire'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text('friends list'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.people),
                    label: Text('find players'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.settings),
                    label: Text('settings'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}
