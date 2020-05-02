import 'package:flutter/material.dart';
import 'package:flutterfirebasechatapp/helpers/components/CustomButton.dart';
import 'package:flutterfirebasechatapp/sections/registration.dart';
import 'package:flutterfirebasechatapp/sections/login.dart';

class CustomColors {
  static const AppColor = Color(0xFFfbae17);
}

class LoginPage extends StatelessWidget {
  static const String id = "HOMESCREEN";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  width: 100.0,
                  child: Image.asset("assets/image/logo.png"),
                ),
              ),
              Text(
                "Flutter Chat",
                style: TextStyle(
                  fontSize: 24.0
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50.0,
          ),
          CustomButton(
            text: "Log In",
            color: CustomColors.AppColor,
            callback: () { Navigator.of(context).pushNamed(Login.id);},
          ),
          CustomButton(
            text: "Register",
            color: Colors.white,
            callback: () {Navigator.of(context).pushNamed(Registration.id);},
          )
        ],
      ),
    );
  }
}
