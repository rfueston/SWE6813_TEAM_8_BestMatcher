import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'account_login.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

const List<String> rating = ["0","1","2","3","4","5","6","7","8","9","10"];
final user = currentUser;

class GameProfile {
  final String? id;
  final int? aggressive;
  final int? communication;
  final int? leader;
  final int? multiplayer;
  final int? sameagegroup;
  final int? seriousness;
  final int? skill;
  final int? strategy;
  final int? trashtalk;
  final int? upset;

  // GameProfile({required this.aggressive, required this.communication,
  //   required this.leader, required this.multiplayer,
  //   required this.sameagegroup, required this.seriousness, required this.skill,
  //   required this.strategy, required this.trashtalk, required this.upset});
  const GameProfile({this.id, this.aggressive, this.communication,
    this.leader, this.multiplayer,
    this.sameagegroup, this.seriousness, this.skill,
    this.strategy, this.trashtalk,  this.upset});

  toJson() {
    return {"aggressive": aggressive, "communication": communication,
      "leader": leader, "multiplayer": multiplayer,
      "sameagegroup": sameagegroup, "seriousness": seriousness,
      "skill": skill, "strategy": strategy,
      "trashtalk": trashtalk, "upset": upset};
  }

  // factory GameProfile.fromFirestore(DocumentSnapshot doc) {
  //   Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  //   return GameProfile(
  //     aggressive: data['aggressive'] ?? 0,
  //     communication: data['communication'] ?? 0,
  //     leader: data['leader'] ?? 0,
  //     multiplayer: data['multiplayer'] ?? 0,
  //     sameagegroup: data['sameagegroup'] ?? 0,
  //     seriousness: data['seriousness'] ?? 0,
  //     skill: data['skill'] ?? 0,
  //     strategy: data['strategy'] ?? 0,
  //     trashtalk: data['trashtalk'] ?? 0,
  //     upset: data['upset'] ?? 0,
  //   );
  // }
  factory GameProfile.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return GameProfile(
          id: document.id,
          aggressive: data['aggressive'],
          communication: data['communication'],
          leader: data['leader'] ?? 0,
          multiplayer: data['multiplayer'],
          sameagegroup: data['sameagegroup'],
          seriousness: data['seriousness'],
          skill: data['skill'],
          strategy: data['strategy'],
          trashtalk: data['trashtalk'],
          upset: data['upset'],
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
  //     aggressive: 0,
  //     communication: 0,
  //     leader: 0,
  //     multiplayer: 0,
  //     sameagegroup: 0,
  //     seriousness: 0,
  //     skill: 0,
  //     strategy: 0,
  //     trashtalk: 0,
  //     upset: 0);

  //get data from Firebase
  _WidgetSetupState() {

  }
  final _db = FirebaseFirestore.instance;
  Future<List<GameProfile>> getMyGameProfile(String user) async {
    final snapshot = await _db.collection("GameProfiles").get();
    final myGameProfile = snapshot.docs.map((e)
    => GameProfile.fromSnapshot(e)).toList();
    return myGameProfile;
  }

  Future<void> udpateGameProfile(String ratingType, int rate) async{
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

  String _curaggressive = "0";
  String _curcommunication = "0";
  String _curleader = "0";
  String _curmultiplayer = "0";
  String _cursameagegroup = "0";
  String _curseriousness = "0";
  String _curskill = "0";
  String _curstrategy = "0";
  String _curtrashtalk = "0";
  String _curupset = "0";

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
                            _curaggressive = element.aggressive.toString() ?? "O";
                            if (_curaggressive == "null"){
                              _curaggressive = "0";
                            }
                            _curcommunication = element.communication
                                .toString() ?? "O";
                            if (_curcommunication == "null"){
                              _curcommunication = "0";
                            }
                            _curleader = element.leader.toString() ?? "O";
                            if (_curleader == "null"){
                              _curleader = "0";
                            }
                            _curmultiplayer = element.multiplayer.toString() ?? "O";
                            if (_curmultiplayer == "null"){
                              _curmultiplayer = "0";
                            }
                            _cursameagegroup = element.sameagegroup.toString() ?? "O";
                            if (_cursameagegroup == "null"){
                              _cursameagegroup = "0";
                            }
                            _curseriousness = element.seriousness.toString() ?? "O";
                            if (_curseriousness == "null"){
                              _curseriousness = "0";
                            }
                            _curskill = element.skill.toString() ?? "O";
                            if (_curskill == "null"){
                              _curskill = "0";
                            }
                            _curstrategy = element.strategy.toString() ?? "O";
                            if (_curstrategy == "null"){
                              _curstrategy = "0";
                            }
                            _curtrashtalk = element.trashtalk.toString() ?? "O";
                            if (_curtrashtalk == "null"){
                              _curtrashtalk = "0";
                            }
                            _curupset = element.upset.toString() ?? "O";
                            if (_curupset == "null"){
                              _curupset = "0";
                            }
                          }
                        }
                        return Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "Rate your gaming profile",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.blue),),
                              ),
                              Container(
                                child: Text("Rate your agressiveness is your playing style:"),
                              ),
                              Container(
                                child: DropdownButton<String>(
                                  items: rating.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value.toString(),
                                      child: Text(value.toString()),
                                    );
                                  }).toList(),
                                  value: _curaggressive.toString(),
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
                                      udpateGameProfile("aggressive", int.parse(value!));
                                      _curaggressive = value;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                child: Text("Rate your communication skill:"),
                              ),
                              Container(
                                child: DropdownButton<String>(
                                  items: rating.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value.toString(),
                                      child: Text(value.toString()),
                                    );
                                  }).toList(),
                                  value: _curcommunication.toString(),
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
                                      udpateGameProfile("communication", int.parse(value!));
                                      _curcommunication = value;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                child: Text("Rate your leadership skill:"),
                              ),
                              Container(
                                child: DropdownButton<String>(
                                  items: rating.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value.toString(),
                                      child: Text(value.toString()),
                                    );
                                  }).toList(),
                                  value: _curleader.toString(),
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
                                      udpateGameProfile("leader", int.parse(value!));
                                      _curleader = value;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                child: Text("Rate your multiplayer skill:"),
                              ),
                              Container(
                                child: DropdownButton<String>(
                                  items: rating.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value.toString(),
                                      child: Text(value.toString()),
                                    );
                                  }).toList(),
                                  value: _curmultiplayer.toString(),
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
                                      udpateGameProfile("multiplayer", int.parse(value!));
                                      _curmultiplayer = value;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                child: Text("Do you want to play in the same age group:"),
                              ),
                              Container(
                                child: DropdownButton<String>(
                                  items: rating.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value.toString(),
                                      child: Text(value.toString()),
                                    );
                                  }).toList(),
                                  value: _cursameagegroup.toString(),
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
                                      udpateGameProfile("sameagegroup", int.parse(value!));
                                      _cursameagegroup = value;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                child: Text("Rate your seriousness when playing games:"),
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
                                      udpateGameProfile("seriousness", int.parse(value!));
                                      _curseriousness = value;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                child: Text("Rate your playing skill:"),
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
                                      udpateGameProfile("skill", int.parse(value!));
                                      _curskill = value;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                child: Text("Rate your strategic skill:"),
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
                                      udpateGameProfile("strategy", int.parse(value!));
                                      _curstrategy = value;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                child: Text("Do you trash talk when playing games:"),
                              ),
                              Container(
                                child: DropdownButton<String>(
                                  items: rating.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value.toString(),
                                      child: Text(value.toString()),
                                    );
                                  }).toList(),
                                  value: _curtrashtalk.toString(),
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
                                      udpateGameProfile("trashtalk", int.parse(value!));
                                      _curtrashtalk = value;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                child: Text("Do you get upset when you lose:"),
                              ),
                              Container(
                                child: DropdownButton<String>(
                                  items: rating.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value.toString(),
                                      child: Text(value.toString()),
                                    );
                                  }).toList(),
                                  value: _curupset.toString(),
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
                                      udpateGameProfile("upset", int.parse(value!));
                                      _curupset = value;
                                    });
                                  },
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

/*class QuestionnairePage extends StatelessWidget {
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
}*/
