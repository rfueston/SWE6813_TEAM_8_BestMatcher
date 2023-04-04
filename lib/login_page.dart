import 'package:flutter/material.dart';
import 'account_login.dart';
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

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _logIn() async {
    //TODO: implement spinner
    // showDialog(context: context, barrierDismissible: false,
    //     builder: (context)=> Center(child: CircularProgressIndicator()));

    var acceptedAcount = AccountLogIn()
        .accountLogIn(userNameController.text, passwordController.text);

    if (await acceptedAcount == true) {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyApp()),
        );
      });
    } else {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyAppLogin()),
        );
      });
    }
      //TODO: implement FireBase auth lib instead of custom
      // try {
      //   await FirebaseAuth.instance.signInWithEmailAndPassword(
      //       email: userNameController.text.trim(),
      //       password: passwordController.text.trim());
      // }on FirebaseAuthException catch (e){
      //   print(e);
      // }
      // navigatorKey.currentState!.popUntil((route)=> route.isFirst);
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
            SizedBox(
              width: 250.0,
              height: 70,
              child: TextField(
                key: Key('loginusername'),
                controller: userNameController,
                maxLength: 40,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
            SizedBox(
              width: 250.0,
              height: 70,
              child: TextField(
                key: Key('loginpassword'),
                controller: passwordController,
                maxLength: 40,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 40),
                maximumSize: const Size(250, 40),
              ),
              onPressed: _logIn,
              child: const Icon(Icons.login),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 40),
                maximumSize: const Size(250, 40),
              ),
              onPressed: _createAccount,
              child: const Icon(Icons.account_box),
            ),
          ],
        ),
      ),
    );
  }
}