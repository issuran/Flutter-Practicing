import 'package:flutter/material.dart';
import 'package:flutterfirebasechatapp/helpers/utils/CustomColors.dart';
import 'package:flutterfirebasechatapp/sections/chat.dart';
import 'package:flutterfirebasechatapp/sections/homepage.dart';
import 'package:flutterfirebasechatapp/sections/login.dart';
import 'package:flutterfirebasechatapp/sections/registration.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id: (context) => LoginPage(),
        Registration.id: (context) => Registration(),
        Login.id: (context) => Login(),
        Chat.id: (context) => Chat(),
      },
    );
  }
}