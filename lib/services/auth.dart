import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterdev/authenticate/user.dart';
import 'package:flutterdev/services/database.dart';

class AuthService {
  static int check;
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  User _userFromFirebaseUser(FirebaseUser user,int ch) {
    print('hello $check');
    return user != null ? User(user.uid,ch) : null;
  }
  
  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
      .map((FirebaseUser user) => _userFromFirebaseUser(user,check));
      //.map(_userFromFirebaseUser);
  }

  // sign in anon
  /*Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }*/

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    check=0;
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      DatabaseService.ud=user.uid;//(attempt to get user id)
      //print('hello $check');
      
      
      return _userFromFirebaseUser(user,check);
    } catch (error) {
      print(error.toString());
      return null;
    } 
  }


  // register with email and password
  Future registerWithEmailAndPassword(String email, String password,String help) async {
    check=1;
    try {
      
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      DatabaseService.ud=user.uid;//(attempt to get user id)
      //print('hello $check');
      //create a new document for the user with the uid
      await DatabaseService().updateUserData("defualt name", "18", help, "0");
      
      return _userFromFirebaseUser(user,check);
    } catch (error) {
      print(error.toString());
      return null;
    } 
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

}