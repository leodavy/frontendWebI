import 'package:flutter/material.dart';
import 'package:frontend_web1/view/Home.dart';
import 'package:frontend_web1/view/Register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        title: const Text("Login",style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
          color: Colors.black
          ),
          child: Column( children: [
            const SizedBox(height: 50),
            Container(
              width: 300,
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: " Usuário:",
                labelStyle: TextStyle(color: Colors.black),
                filled: true,
                fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 5, style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(25)
                    )
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: 300,
              child: TextField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(labelText: " Senha:",
                    labelStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 5, style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(25)
                    )
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed:() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context)=> Home()));
            }, child: Text("Entrar",
              style: TextStyle(
                  color: Colors.black),)),
            TextButton(onPressed:() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context)=> Register()));
            },
                child: Text("Cadastrar-se",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold)))
          ],),
        ),
      ) );
  }
}
