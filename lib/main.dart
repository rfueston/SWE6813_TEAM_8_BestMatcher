import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'create_account_page.dart';
import 'questionnaire_page.dart';
import 'friends_list_page.dart';
import 'account_profile_page.dart';
import 'history_page.dart';
import 'match_making_page.dart';
import 'settings_page.dart';
import 'home_page.dart';
import 'login_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'BestMatch App',
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
        page = AccountProfilePage();
        break;
      case 4:
        page = HistoryPage();
        break;
      case 5:
        page = MatchMakingPage();
        break;
      case 6:
        page = SettingsPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'BestMatcher',
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
                    label: Text('main'),
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
                    icon: Icon(Icons.security),
                    label: Text('account profile'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.history),
                    label: Text('history'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.people),
                    label: Text('match making'),
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
