import 'package:cloud_firestore/cloud_firestore.dart';
String currentUser = "";
class AccountLogIn {

  Future<bool> accountLogIn(username, password) async {

    final CollectionReference accountCollection =
    FirebaseFirestore.instance.collection('Accounts');

    var account = await accountCollection
        .where("username", isEqualTo: username)
        .where("password", isEqualTo: password)
        .get().then((value) => value.size > 0 ? true : false);

    if(account == true){
      currentUser = username; //set global current user
      return true;
    } else {
      return false;
    }
  }
}
