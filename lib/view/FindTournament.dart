import 'package:flutter/material.dart';
import 'package:frontend_web1/model/User.dart';
import 'package:frontend_web1/view/SelectedTournament.dart';

import '../model/Tournament.dart';
import '../service/Services.dart';

class FindTournament extends StatefulWidget {
  const FindTournament({super.key});

  @override
  State<FindTournament> createState() => _FindTournamentState();
}

class _FindTournamentState extends State<FindTournament> {
  final TextEditingController _nameController = TextEditingController();
  List<Tournament> tournaments = [];

  @override
  void initState() {
    super.initState();
    loadTournaments();
  }
  void loadTournaments() async {
    try {
      List<Tournament> loadedTournaments = await Services().getAllTournaments();
      setState(() {
        tournaments = loadedTournaments;
      });
    } catch (error) {
      print("Error loading tournaments: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
            "Consultar Torneio",
            style: TextStyle(
                color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount:  tournaments.length,
        itemBuilder: (context, index){
          return Card(
            margin: EdgeInsets.all(16.0),
            child: ListTile(
              title: Text(tournaments[index].torTxNome!),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=>
                            SelectedTournament(
                            tournament: tournaments[index])));
              },
            ),
          );
        },
      )
    );
  }
}
