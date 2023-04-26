import 'package:english_words/english_words.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'account_login.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

const List<String> rating = ["-","0","1","2","3","4","5"];
final user = FirebaseAuth.instance.currentUser?.email;


class GameProfile {
  final String? id;
  final int? aggression;
  final int? seriousness;
  final int? skill;
  final int? strategy;
  final int? teamwork;

  // GameProfile({required this.aggression, required this.seriousness,
  //   required this.skill, required this.strategy,
  //    required this.teamwork});
  const GameProfile({this.id, this.aggression, this.seriousness,
    this.skill, this.strategy, this.teamwork});

  toJson() {
    return {"aggression": aggression, "seriousness": seriousness,
      "leader": skill, "strategy": strategy,
      "teamwork": teamwork};
  }

  // factory GameProfile.fromFirestore(DocumentSnapshot doc) {
  //   Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  //   return GameProfile(
  //     aggression: data['aggression'] ?? 0,
  //     seriousness: data['seriousness'] ?? 0,
  //     skill: data['skill'] ?? 0,
  //     strategy: data['strategy'] ?? 0,
  //     teamwork: data['teamwork'] ?? 0,
  //   );
  // }
  factory GameProfile.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return GameProfile(
          id: document.id,
          aggression: data['aggression'],
          seriousness: data['seriousness'],
          skill: data['skill'],
          strategy: data['strategy'],
          teamwork: data['teamwork'],
    );
  }
}


class QuestionnairePage extends StatelessWidget {


  @override
    Widget build(BuildContext context) {
    return MaterialApp(
    home: const WidgetSetup(),
    );
  }
}

class WidgetSetup extends StatefulWidget {
  const WidgetSetup({super.key});

  @override
  State<WidgetSetup> createState() => _WidgetSetupState();
}

class _WidgetSetupState extends State<WidgetSetup> {

  // GameProfile myGameProfile = GameProfile(
  //     aggression: 0,
  //     seriousness: 0,
  //     skill: 0,
  //     strategy: 0,
  //     teamwork: 0,

  //get data from Firebase
  //_WidgetSetupState() {

 // }
  final _db = FirebaseFirestore.instance;
  Future<List<GameProfile>> getMyGameProfile(String? user) async {
    final snapshot = await _db.collection("GameProfiles").get();
    final myGameProfile = snapshot.docs.map((e)
    => GameProfile.fromSnapshot(e)).toList();
    return myGameProfile;
  }

  Future<void> updateGameProfile(String ratingType, int rate) async{
    final CollectionReference myAdvCollection =
    FirebaseFirestore.instance.collection("GameProfiles");

    final data = <String, dynamic>{
      ratingType : rate,
    };

    var docRef  = myAdvCollection.doc(user);
    docRef.get().then((doc) async =>
    {
      if (doc.exists) {
        await myAdvCollection.doc(user).update(data)
      } else {
        await myAdvCollection.doc(user).set(data)
      }
    });
  }

  String _curaggression = "-";
  String _curseriousness = "-";
  String _curskill = "-";
  String _curstrategy = "-";
  String _curteamwork = "-";


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(child:SingleChildScrollView(
              child: FutureBuilder<List<GameProfile>>(
                  future: getMyGameProfile(user),
                  builder: (ctx, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      // If we got an error
                      if (snapshot.hasData) {
                        for (var element in snapshot.data!) {
                          if (element.id == user) {
                            _curaggression = element.aggression.toString() ?? "O";
                            if (_curaggression == "null"){
                              _curaggression = "-";
                            }
                            _curseriousness = element.seriousness
                                .toString() ?? "O";
                            if (_curseriousness == "null"){
                              _curseriousness = "-";
                            }
                            _curskill = element.skill.toString() ?? "O";
                            if (_curskill == "null"){
                              _curskill = "-";
                            }
                            _curstrategy = element.strategy.toString() ?? "O";
                            if (_curstrategy == "null"){
                              _curstrategy = "-";
                            }
                            _curteamwork = element.teamwork.toString() ?? "O";
                            if (_curteamwork  == "null"){
                              _curteamwork = "-";
                            }
                          }
                        }
                        return Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "Make your gaming profile",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.blue),),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "Rate the following statements about your playing style from 0 to 5, with 0 being the least and 5 being the most.",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.blueGrey),)
                              ),
                              Container(
                                child: Text("Rate your aggression when you play:"),
                              ),
                              Container(
                                child: DropdownButton<String>(
                                  items: rating.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value.toString(),
                                      child: Text(value.toString()),
                                    );
                                  }).toList(),
                                  value: _curaggression.toString(),
                                  icon: const Icon(Icons.arrow_downward),
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.deepPurple),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  onChanged: (String? value) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                      updateGameProfile("aggression", int.parse(value!));
                                      _curaggression = value;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                child: Text("Rate how seriously you take the game:"),
                              ),
                              Container(
                                child: DropdownButton<String>(
                                  items: rating.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value.toString(),
                                      child: Text(value.toString()),
                                    );
                                  }).toList(),
                                  value: _curseriousness.toString(),
                                  icon: const Icon(Icons.arrow_downward),
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.deepPurple),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  onChanged: (String? value) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                      updateGameProfile("seriousness", int.parse(value!));
                                      _curseriousness = value;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                child: Text("Rate your skill at the game:"),
                              ),
                              Container(
                                child: DropdownButton<String>(
                                  items: rating.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value.toString(),
                                      child: Text(value.toString()),
                                    );
                                  }).toList(),
                                  value: _curskill.toString(),
                                  icon: const Icon(Icons.arrow_downward),
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.deepPurple),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  onChanged: (String? value) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                      updateGameProfile("skill", int.parse(value!));
                                      _curskill = value;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                child: Text("Rate how much you strategize when you play the game:"),
                              ),
                              Container(
                                child: DropdownButton<String>(
                                  items: rating.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value.toString(),
                                      child: Text(value.toString()),
                                    );
                                  }).toList(),
                                  value: _curstrategy.toString(),
                                  icon: const Icon(Icons.arrow_downward),
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.deepPurple),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  onChanged: (String? value) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                      updateGameProfile("strategy", int.parse(value!));
                                      _curstrategy = value;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                child: Text("Rate how well you work in a team:"),
                              ),
                              Container(
                                child: DropdownButton<String>(
                                  items: rating.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value.toString(),
                                      child: Text(value.toString()),
                                    );
                                  }).toList(),
                                  value: _curteamwork.toString(),
                                  icon: const Icon(Icons.arrow_downward),
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.deepPurple),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  onChanged: (String? value) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                      updateGameProfile("teamwork", int.parse(value!));
                                      _curteamwork = value;
                                    });
                                  },
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
                                      onPressed: null,
                                      child: const Icon(Icons.outgoing_mail),
                                    ),
                                  ],
                                ),
                              ),
                            ]

                        );
                      } else if (snapshot.hasError){
                        return Center(child: Text(snapshot.error.toString()));
                      } else {
                        return const Center(child: Text('Something went wrong'));
                      }
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }

              )
          ))
      ),
    );
  }

}


/*

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

          ],
        ),
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}*/
