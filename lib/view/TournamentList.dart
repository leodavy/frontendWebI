import 'package:flutter/material.dart';
import 'package:frontend_web1/model/User.dart';

class TournamentSearch extends StatefulWidget {
  const TournamentSearch({super.key});

  @override
  State<TournamentSearch> createState() => _TournamentSearchState();
}

class _TournamentSearchState extends State<TournamentSearch> {
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
        title: const Text("Consulta: Torneio",style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              // height: MediaQuery.of(context).size.height * 0.4,
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
                    decoration: InputDecoration(hintText: " Nome:",
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
                // Container(
                //   width: 300,
                //   child: TextFormField(
                //     controller: _usernameController,
                //     decoration: InputDecoration(hintText: " Login:",
                //         labelStyle: TextStyle(color: Colors.black),
                //         filled: true,
                //         fillColor: Colors.white,
                //         border: OutlineInputBorder(
                //             borderSide: const BorderSide(width: 5, style: BorderStyle.none),
                //             borderRadius: BorderRadius.circular(25)
                //         )
                //     ),
                //   ),
                // ),
                SizedBox(height: 5),
                // Container(
                //   width: 300,
                //   child: TextFormField(
                //     obscureText: true,
                //     controller: _passwordController,
                //     decoration: InputDecoration(hintText: " Senha:",
                //         labelStyle: TextStyle(color: Colors.black),
                //         filled: true,
                //         fillColor: Colors.white,
                //         border: OutlineInputBorder(
                //             borderSide: const BorderSide(width: 5, style: BorderStyle.none),
                //             borderRadius: BorderRadius.circular(25)
                //         )
                //     ),
                //   ),
                // ),
                SizedBox(height: 10),
                ElevatedButton(onPressed:() {
                }, child: Text("Procurar",style: TextStyle(color: Colors.black),))
              ],),
            ),
          ],
        ),
      ) );
  }
}
