import 'package:flutter/material.dart';
import 'package:frontend_web1/view/TournamentRegister.dart';
import 'package:frontend_web1/view/FindTournament.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: const Text("Home", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 150,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            color: Colors.black
                        ),
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context)=> TournamentRegister()));
                              },
                              icon: Icon(Icons.add, size: 90),
                            ),
                            Text("Cadastrar Torneio",
                              style: TextStyle(color: Colors.white,
                                  fontSize: 20),)
                          ],
                        ),
                      ),
                      SizedBox(width: 25),
                      Container(
                        height: 150,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            color: Colors.black
                        ),
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context)=> FindTournament()));
                              },
                              icon: Icon(Icons.search, size: 90),
                            ),
                            Text("Consultar Torneio",
                              style: TextStyle(color: Colors.white,
                                  fontSize: 20))
                          ],
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 25,),
                  Container(
                    height: 150,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        color: Colors.black
                    ),
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: () {

                          },
                          icon: Icon(Icons.search, size: 90),
                        ),
                        Text("Consultar Usuário",
                          style: TextStyle(color: Colors.white,
                              fontSize: 20),)
                      ],
                    ),
                  )
                ]
            )
        )
    );
  }
}