import 'package:flutter/material.dart';
import 'package:frontend_web1/model/Tournament.dart';
import 'package:frontend_web1/view/CategoryCreate.dart';

class SelectedTournament extends StatefulWidget {
   SelectedTournament({super.key, required this.tournament });
Tournament tournament;

  @override
  State<SelectedTournament> createState() => _SelectedTournamentState();
}

class _SelectedTournamentState extends State<SelectedTournament> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title:  Text("${widget.tournament.torTxNome}",style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(children: [
            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryCreate(tournament: widget.tournament),
                ),
              );
            },
                child: Text("Criar categoria"))
          ]
        )
      )
    );
  }
}
