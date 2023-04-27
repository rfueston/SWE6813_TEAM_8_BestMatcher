import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'main.dart';
import 'create_account.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'message.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MyMessagePageState();
}

class _MyMessagePageState extends State<MessagePage> {

  final user = FirebaseAuth.instance.currentUser;

  FirebaseMessaging messaging = FirebaseMessaging.instance;


  List<MessageItem> _message = [
    MessageItem(
      text: "Yo",
      date: DateTime.now().subtract(Duration(days: 1)),
      isSentByMe:  true,
    ),
    MessageItem(
      text: "Hi",
      date: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByMe:  false,
    ),
    MessageItem(
      text: "what game you want to play?",
      date: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByMe:  true,
    ),
    MessageItem(
      text: "let's play fucking Apex!",
      date: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByMe:  false,
    ),

  ].reversed.toList();

   bool msgFilter = false;

  final msgController = TextEditingController();

  @override
  void dispose() {
    msgController.dispose();
    super.dispose();
  }

  Future<void> _sendMyMessage() async {
    final message = MessageItem(
      text: msgController.text,
      date: DateTime.now(),
      isSentByMe: true,
    );

    // msgController.dispose();

    setState(() => _message.add(message));
  }

  void _volatileFilter()  {

    if (msgFilter == false) {
      msgFilter = true;
    }  else {
      msgFilter = false;
    }
    setState((){});
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Testuser 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: GroupedListView<MessageItem, DateTime>(
                elements: _message,
                groupBy: (message) => DateTime(
                  message.date.year,
                  message.date.month,
                  message.date.day,
                ),
                groupHeaderBuilder: (MessageItem message)  => SizedBox(
                  height: 40,
                  child: Center(
                    child: Card(
                      color: Colors.blueGrey,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          DateFormat("yyyy-MM-dd HH:mm:ss").format(message.date),
                          style: const TextStyle(color: Colors.white)
                        ),

                      ),
                    ),
                  ),
                ),
                itemBuilder: (context, MessageItem message) => Align(
                  alignment: message.isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                        child: msgFilter == false ? Text(message.text) :  Text(message.text + 'is this working????')
                    ),
                  ),
                ),
              ),
              ),
            SizedBox(
              width: 350.0,
              height: 100,
              child: TextField(
                key: Key('chattext'),
                controller: msgController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Your message',
                ),
              ),
            ),
            ElevatedButton(
              key: Key('sendbutton'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 50),
                maximumSize: const Size(250, 50),
              ),
              onPressed: _sendMyMessage,
              child: const Text('SEND'),
            ),
            ElevatedButton(
              key: Key('langbutton'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 50),
                maximumSize: const Size(250, 50),
              ),
              onPressed: _volatileFilter,
              child: const Text('Communication Filter'),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageItem {
  final String text;
  final date;
  final bool isSentByMe;

  MessageItem({
    required this.text,
    required this.date,
    required this.isSentByMe,
  });
}
