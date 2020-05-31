import 'package:firebaseFlutter/screens/authenticate/authenticate.dart';
import 'package:firebaseFlutter/shared/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebaseFlutter/services/auth.dart';
import 'package:firebaseFlutter/models/user.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
//  emailstate
  final user = User();
  String email = '';
  String password = '';
  String error = "";
  final _formKey = GlobalKey<FormState>();

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to brew'),
        actions: <Widget>[
          FlatButton.icon(
            label: Text('register'),
            icon: Icon(Icons.person),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(
                    validator: (value) {
                      return value.isEmpty
                          ? 'please enter a valid email'
                          : null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: KTextInputDecoration.copyWith(hintText: 'email'),
                    onChanged: (value) {
//                  print(value);
                      setState(() {
                        email = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      return value.isEmpty
                          ? 'password must be atleast 6 characters'
                          : null;
                    },
                    decoration: KTextInputDecoration.copyWith(hintText: 'password'),
                    obscureText: true,
                    onChanged: (value) {
//                  print(value);
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                  SizedBox(height: 20.0),
                  Text(error.isEmpty ? "" : error),
                  RaisedButton(
                      color: Colors.pink[400],
                      child: Text('Sign in'),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          dynamic result = await _auth.signIn(email, password);
                          if (result != user) {
                            setState(() => error = result);
                          }
                        }
                      })
                ],
              ))),
    );
  }
}
