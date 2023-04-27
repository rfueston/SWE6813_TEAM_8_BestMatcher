import 'package:best_matcher/login_page.dart';
import 'package:best_matcher/utils.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'create_account.dart';


class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});
  @override
  State<CreateAccountPage> createState() => _MyCreateAccountPageState();
}

class _MyCreateAccountPageState extends State<CreateAccountPage> {
  final myControllerFirstName = TextEditingController();
  final myControllerLastName = TextEditingController();
  final myControllerUsername = TextEditingController();
  final myControllerPassword = TextEditingController();
  final myControllerRepeatPassword = TextEditingController();
  final myControllerEmail = TextEditingController();
  final myControllerAge = TextEditingController();

  @override
  void dispose() {
    myControllerUsername.dispose();
    myControllerPassword.dispose();
    myControllerFirstName.dispose();
    myControllerLastName.dispose();
    myControllerRepeatPassword.dispose();
    myControllerEmail.dispose();
    myControllerAge.dispose();
    super.dispose();
  }

  Future<void> _createAccountLogin() async {
    var existedAcount = false;
    if(myControllerUsername.text.trim() == ''){
      var error = " Empty user name";
      Utils.showMyDialog('Failed', 'Account creation failed!' + error, context);
    }else {
      CreateAccount().createAccountCheck(myControllerUsername.text);
    }

    if (await existedAcount == true) {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const MyAppLogin()),
        );
      });
    } else if ((await existedAcount == false &&
        myControllerPassword.text == myControllerRepeatPassword.text
        && myControllerUsername.text != '')) {
      if(myControllerUsername.text == myControllerEmail.text){
      var accountCreated = CreateAccount().createUserAccount(
          myControllerFirstName.text,
          myControllerLastName.text,
          myControllerUsername.text,
          myControllerPassword.text,
          myControllerEmail.text,
          myControllerAge.text);

      // setState(() {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => const MyApp()),
      //   );
      // });
      if (await accountCreated == 'true') {
        Utils.showMyDialog('Success',
            'Account created successfully! Please login with your credentials.',
            context);
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        });
      } else {
        Utils.showMyDialog(
            'Failed', 'Account creation failed! ' + await accountCreated,
            context);
      }
    }else{
      Utils.showMyDialog('Error', 'Please provide same email id for both username and email fields', context);
    }
    } else {
      var error;
      if(myControllerPassword.text != myControllerRepeatPassword.text){
        error = " Passwords don't match";
      }
      if(myControllerUsername.text.trim() == '' && existedAcount){
        error = " Empty user name";
      }
      if(myControllerEmail.text.trim() == ''){
        error = " Empty email field";
      }
      Utils.showMyDialog('Failed', 'Account creation failed!' + error, context);

    }
  }

  void _cancelAccountLogin() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BestMatcher"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 250.0,
              height: 60,
              child: TextField(
                key: Key('createaccountfirstname'),
                controller: myControllerFirstName,
                maxLength: 20,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'First Name',
                ),
              ),
            ),
            SizedBox(
              width: 250.0,
              height: 60,
              child: TextField(
                key: Key('createaccountlastname'),
                controller: myControllerLastName,
                maxLength: 20,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last Name',
                ),
              ),
            ),
            SizedBox(
              width: 250.0,
              height: 60,
              child: TextField(
                key: Key('createaccountusername'),
                controller: myControllerUsername,
                maxLength: 20,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username in email format',
                ),
              ),
            ),
            SizedBox(
              width: 250.0,
              height: 60,
              child: TextField(
                key: Key('createaccountpassword'),
                controller: myControllerPassword,
                maxLength: 20,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            SizedBox(
              width: 250.0,
              height: 60,
              child: TextField(
                key: Key('createaccountrepeat'),
                controller: myControllerRepeatPassword,
                maxLength: 20,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Repeat Password',
                ),
              ),
            ),
            SizedBox(
              width: 250.0,
              height: 60,
              child: TextField(
                key: Key('createaccountemail'),
                controller: myControllerEmail,
                maxLength: 20,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email Address',
                ),
              ),
            ),
            SizedBox(
              width: 250.0,
              height: 60,
              child: TextField(
                key: Key('createaccountage'),
                controller: myControllerAge,
                maxLength: 20,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Age',
                ),
              ),
            ),
            ElevatedButton(
              key: Key('createbuttonAccount'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 40),
                maximumSize: const Size(250, 40),
              ),
              onPressed: _createAccountLogin,
              child: const Icon(Icons.account_box),
            ),
            ElevatedButton(
              key: Key('cancelbuttonAccount'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 40),
                maximumSize: const Size(250, 40),
              ),
              onPressed: _cancelAccountLogin,
              child: const Icon(Icons.cancel),
            ),
          ],
        ),
      ),
    );
  }

}
