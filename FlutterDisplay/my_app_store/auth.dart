
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class Auth implements BaseAuth {
  //noSuchMethod(Invocation Auth) => super.noSuchMethod(Auth);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
 
  Future <String> createUserWithEmailAndpassword(String email, String password) async {
    FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    return user.uid;
  }
  Future <String> signInWithEmailAndPassword(String email, String password) async {
    FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return user.uid;
  }
  Future <String> currentUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user.uid;
  }
  Future <void> signOut() async {
    return _firebaseAuth.signOut();
  } 
}
//all ok
abstract class BaseAuth{
  Future <String> signInWithEmailAndPassword(String email, String password);
  Future <String> createUserWithEmailAndPassword(String email, String password);
  Future <String> currentUser();
  Future <void> signOut();
}