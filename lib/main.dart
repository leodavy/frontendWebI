import 'package:flutter/material.dart';
import 'package:frontend_web1/view/Login.dart';



void main() async {
  runApp(ProjetoWebI());
}

class ProjetoWebI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/Login",
      routes: {
        "/Login": (context) => Login()
      },
    );
  }
}