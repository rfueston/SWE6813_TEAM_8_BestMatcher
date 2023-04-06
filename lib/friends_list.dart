import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class FriendsList {

  //TODO: https://sweksu.atlassian.net/browse/WEB-33
  Future<String> setFriendsList(username) async {
    final CollectionReference friendsCollection =
        FirebaseFirestore.instance.collection('Friends');

    Future<dynamic>? friendlist = {''} as Future;
    Future<dynamic> friendlisttest = '' as Future;

    await friendsCollection.get().then((event) {
      for (var doc in event.docs) {
        if (doc.id == username) {
          friendlist = doc.data() as Future?;
          print("${doc.id} => ${doc.data()}");
          friendlisttest = "${doc.data()}" as Future;
        }
      }
    });

    print(friendlist);

    String test1 = await friendlisttest;


    return test1;
  }

  // String getFriendsList() {
  //
  //
  //   FriendsList().setFriendsList("sdu");
  //
  //   var test = '';
  //
  //   if (FriendsList().setFriendsList("sdu") == null) {
  //     test = '';
  //    else {
  //     test = FriendsList().setFriendsList("sdu") as String;
  //   }
  //
  //
  //   return test;
  // }

  void checkUserFriendsList() {}

  void updateFriendsList() {}
}
