import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateAccount {
  Future<bool> createAccountCheck(String username) async {
    // final CollectionReference accountCollection =
    //     FirebaseFirestore.instance.collection('Accounts');
    try {
      final list = await FirebaseAuth.instance.fetchSignInMethodsForEmail(username);
      if (list.isNotEmpty) {
        return true;
      }
      return false;
    } catch (error) {
      return true;
    }
    // var test = await accountCollection
    //     .where("username", isEqualTo: username)
    //     .get()
    //     .then((value) => value.size > 0 ? true : false);
    //
    // if (test == true) {
    //   return true;
    // } else {
    //   return false;
    // }
  }

  Future<String> createUserAccount(
      firstname, lastname, username, password, email, age) async {
    try{
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      final CollectionReference accountCollection =
      FirebaseFirestore.instance.collection('Accounts');

      final data = <String, dynamic>{
        "email": email,
        "firstname": firstname,
        "lastname": lastname,
        "username": username,
        "age": age,
      };
      accountCollection.doc(username).set(data);
      return 'true';
    } on FirebaseAuthException catch (authException){
      if(authException.code == 'weak-password'){
        print ('The password provided is too weak');
        return authException.code;
      }else if (authException.code == 'email-already-in-use'){
        print ('The account already exists for that email');
        return authException.code;
      }
    }catch (e){
      print (e);
      return e.toString();
    }
return 'false';
  }
}
