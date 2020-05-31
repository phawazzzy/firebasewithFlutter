import 'package:firebaseFlutter/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static const String id = "home_screen";

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.brown[400],
        title: Text('Brew Crew'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person, color: Colors.white,),
            onPressed: () async {
             await _auth.signOut();
            },
            label: Text('Log out'),
          ),
        ],
      ),
    );
  }
}
