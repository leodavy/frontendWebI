import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importe o pacote intl para formatar a data
import 'package:frontend_web1/model/User.dart';
import 'package:frontend_web1/service/Services.dart';

class FindUser extends StatefulWidget {
  const FindUser({Key? key}) : super(key: key);

  @override
  _FindUserState createState() => _FindUserState();
}

class _FindUserState extends State<FindUser> {
  final TextEditingController _nameController = TextEditingController();
  User? _foundUser;

  searchUser() async {
    try {
      String name = _nameController.text;
      print("Searching for user: $name");
      User? user = await Services().getUserByName(name);
      print("Found user: $user");

      if (user != null) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Informações do usuário:"),
              content: Column(
                children: [
                  Text("ID: ${user.usuNrId}"),
                  Text("Nome: ${user.usuTxNome}"),
                  Text("Login: ${user.usuTxLogin}"),
                  Text("Data de Cadastro: ${_formatDate(user.usuDtCadastro)}"), // Adicione esta linha para exibir a data formatada
                ],
              ),
            );
          },
        );
      }

      setState(() {
        _foundUser = user;
      });
    } catch (error) {
      print("Error searching for user: $error");
    }
  }

  String _formatDate(DateTime? date) {
    if (date != null) {
      return DateFormat('dd/MM/yyyy HH:mm:ss').format(date);
    } else {
      return 'N/A';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: const Text("Buscar Usuário", style: TextStyle(color: Colors.white)),
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
                  SizedBox(height: 15),
                  ElevatedButton(onPressed:() async {
                    await searchUser();
                  }, child: Text("Buscar",style: TextStyle(color: Colors.black),))
                ],),
              ),
            ],
          ),
        )
    );
  }
}