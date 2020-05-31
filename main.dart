import 'package:firebaseFlutter/services/auth.dart';
import 'package:flutter/material.dart';
import 'wrapper.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';
import 'package:firebaseFlutter/screens/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        routes: {
          Home.id: (context) => Home(),
        },
        home: Wrapper(),
      ),
    );
  }
}

