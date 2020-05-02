import 'package:flutter/material.dart';
import 'package:flutterfirebasechatapp/sections/login/login_page.dart';
import 'package:flutterfirebasechatapp/sections/login/states/login.dart';
import 'package:flutterfirebasechatapp/sections/login/states/registration.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id: (context) => LoginPage(),
        Registration.id: (context) => Registration(),
        Login.id: (context) => Login(),
      },
    );
  }
}