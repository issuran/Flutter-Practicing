import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  final String usuario;

  const Welcome({Key key, this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('Bem vindo'),
      ),
      body: Center(
        child: Text("Seja bem vindo, $usuario",
        style: TextStyle(
          fontSize: 20
        ))
      ),
    );
  }
}
