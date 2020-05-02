import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebasechatapp/helpers/components/CustomButton.dart';
import 'package:flutterfirebasechatapp/sections/chat.dart';
import 'package:flutterfirebasechatapp/sections/homepage.dart';

class Login extends StatefulWidget {
  static const String id = "LOGIN";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email;
  String password;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginUser() async {
    FirebaseUser user = (await _auth.signInWithEmailAndPassword(
        email: email,
        password: password
    )).user;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Chat(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Hero(
              tag: 'logo',
              child: Container(
                width: 30,
                height: 30,
                child: Image.asset("assets/image/logo.png"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) => email = value,
              decoration: InputDecoration(
                  hintText: "Enter your email",
                  border: const OutlineInputBorder()
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              autocorrect: false,
              obscureText: true,
              onChanged: (value) => password = value,
              decoration: InputDecoration(
                  hintText: "Enter your password",
                  border: const OutlineInputBorder()
              ),
            ),
          ),
          CustomButton(
            color: CustomColors.AppColor,
            text: "Log In",
            callback: () async {
              await loginUser();
            },
          )
        ],
      ),
    );
  }
}
