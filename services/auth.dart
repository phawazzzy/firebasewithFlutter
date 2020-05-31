import 'package:firebaseFlutter/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  //login with custom user

  User _userFromFirebase(FirebaseUser user) {
      return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map((FirebaseUser user) => _userFromFirebase(user));
  }

  final FirebaseAuth _auth  = FirebaseAuth.instance;
  //sign in anon

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebase(user);
    } catch(e) {
        print(e.toString());
        return null;
    }
  }

  //sign in email and password

  Future signIn(String email, String password) async{
    String formattedemail = email.trim();
    String formattedpassword = password.trim();
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: formattedemail, password: formattedpassword);
      FirebaseUser user = result.user;
      return _userFromFirebase(user);
    } catch(e){
      print(e);
      return e.toString();
    }
  }

  //register email and password
  Future register(String email, String password) async{
    String formattedemail = email.trim();
    String formattedpassword = password.trim();
    try{
     AuthResult  result = await _auth.createUserWithEmailAndPassword(email: formattedemail, password: formattedpassword);
       FirebaseUser user = result.user;
       return _userFromFirebase(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
 Future signOut() async{
    try{
      await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return e.toString();
    }
  }

}