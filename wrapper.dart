import 'package:firebaseFlutter/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:firebaseFlutter/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);
    //return home or auth screen depending auth status
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
