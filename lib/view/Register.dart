import 'package:flutter/material.dart';
import 'package:frontend_web1/model/User.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void register() async {
    String name = _nameController.text;
    String password = _passwordController.text;
    String username = _usernameController.text;
    DateTime dateTime = DateTime.now();

    User newUser = User(
      usuTxNome: name,
      usuTxLogin: username,
      usuTxSenha: password,
      usuDtCadastro: dateTime
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text("Registro",style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
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
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: " Nome:",
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
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(labelText: " Login:",
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
                  child: TextFormField(
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
                }, child: Text("Cadastrar",style: TextStyle(color: Colors.black),))
              ],),
            ),
          ],
        ),
      ) );
  }
}
