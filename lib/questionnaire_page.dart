import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class QuestionnairePage extends StatelessWidget {
  void _submitForm() {}

  void _clearForm() {}

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
              key: Key('firstquestion'),
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'How serious do you take online gaming?',
              ),
            ),
            const TextField(
              key: Key('secondquestion'),
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText:
                'If you are losing will you quit in the middle of a game?',
              ),
            ),
            const TextField(
              key: Key('thirdquestion'),
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Do you consider yourself a toxic player?',
              ),
            ),
            const Text('Please select your reaction to getting player killed:'),
            Container(
              child: Row(
                children: [
                  Radio(
                      value: "Rage!",
                      groupValue: "q4",
                      onChanged: (value) {
                        print(value); //selected value
                      }),
                  const Text("Rage!"),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Radio(
                      value: "You are calm!",
                      groupValue: "q4",
                      onChanged: (value) {
                        print(value); //selected value
                      }),
                  const Text("You are calm!"),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Radio(
                      value: "You get Annoyed",
                      groupValue: "q4",
                      onChanged: (value) {
                        print(value); //selected value
                      }),
                  const Text("You get Annoyed"),
                ],
              ),
            ),
            const TextField(
              key: Key('fifthquestion'),
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText:
                'Do you come up with strategies with the team or try to play solo?',
              ),
            ),
            Container(
              child: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(100, 40),
                      maximumSize: Size(300, 40),
                    ),
                    onPressed: _submitForm,
                    child: const Icon(Icons.outgoing_mail),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(100, 40),
                      maximumSize: Size(300, 40),
                    ),
                    onPressed: _clearForm,
                    child: const Icon(Icons.cancel_presentation_rounded),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
