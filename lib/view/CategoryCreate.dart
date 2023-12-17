import 'package:flutter/material.dart';
import 'package:frontend_web1/model/Tournament.dart';

import '../model/TournamentCategory.dart';
import '../service/Services.dart';

class CategoryCreate extends StatefulWidget {
   CategoryCreate({super.key, required this.tournament});
Tournament tournament;
  @override
  State<CategoryCreate> createState() => _CategoryCreateState();
}

class _CategoryCreateState extends State<CategoryCreate> {
  final TextEditingController _nameController = TextEditingController();

  register() async {
    try {
      FocusManager.instance.primaryFocus?.unfocus();
      String name = _nameController.text;
      int? torNrId = widget.tournament.torNrId;
      if(torNrId != null){
        TournamentCategory tournamentCategory = TournamentCategory(
            catTxNome: name,

        );
        await Services().createCategory(torNrId,tournamentCategory);
      }
    } catch (error){
      print("Category register error: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title:  Text("${widget.tournament.torTxNome} - Criar Categoria",style: TextStyle(color: Colors.white)),
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
                ElevatedButton(onPressed:() async {
                  await register();
                  Navigator.pop(context);
                }, child: Text("Cadastrar",style: TextStyle(color: Colors.black),))
              ],),
            ),
          ],
        ),
      ) ,

    );
  }
}
