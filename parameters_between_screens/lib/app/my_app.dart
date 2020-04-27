import 'package:flutter/material.dart';
import 'package:parametersbetweenscreens/home/home_page.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.amber,
        appBarTheme: AppBarTheme(
          color: Colors.red
        )
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}