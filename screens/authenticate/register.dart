import 'package:flutter/material.dart';
import 'package:firebaseFlutter/services/auth.dart';
import 'package:firebaseFlutter/models/user.dart';
import 'package:firebaseFlutter/screens/home/home.dart';
import 'package:firebaseFlutter/shared/constant.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  String email = "";
  String password = "";
  String error = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign Up to Brew Crew'),
        actions: <Widget>[
          FlatButton.icon(
            label: Text('Sign in'),
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
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value.isEmpty ? 'enter email' : null,
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
                validator: (value) => value.length < 6
                    ? 'password must be atleast 6 letters'
                    : null,
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
              Text(error.isEmpty ? '' : error, style: TextStyle(color: Colors.red),),
              RaisedButton(
                  color: Colors.pink[400],
                  child: Text('Register'),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result = await _auth.register(email, password);
                      if (result == null) {
                        print('error occured');
                        setState(() {
                          error = 'something went wrong please try again';
                        });
                      }
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
