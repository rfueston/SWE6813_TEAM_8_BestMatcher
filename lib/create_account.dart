import 'package:cloud_firestore/cloud_firestore.dart';

class CreateAccount {
  Future<bool> createAccountCheck(username) async {
    final CollectionReference accountCollection =
        FirebaseFirestore.instance.collection('Accounts');

    var test = await accountCollection
        .where("username", isEqualTo: username)
        .get()
        .then((value) => value.size > 0 ? true : false);

    if (test == true) {
      return true;
    } else {
      return false;
    }
  }

  void createUserAccount(
      firstname, lastname, username, password, email, age) {
    final CollectionReference accountCollection =
        FirebaseFirestore.instance.collection('Accounts');

    final data = <String, dynamic>{
      "email": email,
      "firstname": firstname,
      "lastname": lastname,
      "username": username,
      "password": password,
      "age": age,
    };
    accountCollection.doc(username).set(data);
  }
}
