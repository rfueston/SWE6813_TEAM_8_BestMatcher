import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _MyloginPageState();
}

class _MyloginPageState extends State<LoginPage> {

  void _logIn() {
    setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyApp()),
        );
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
            const TextField(
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'USERNAME',
              ),
            ),
            const TextField(
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