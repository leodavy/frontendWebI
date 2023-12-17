import 'package:flutter/material.dart';
import 'package:frontend_web1/model/Tournament.dart';
import 'package:frontend_web1/view/CategoryCreate.dart';

import '../model/TournamentCategory.dart';
import '../service/Services.dart';

class SelectedTournament extends StatefulWidget {
   SelectedTournament({super.key, required this.tournament });
Tournament tournament;

  @override
  State<SelectedTournament> createState() => _SelectedTournamentState();
}

class _SelectedTournamentState extends State<SelectedTournament> {
  List<TournamentCategory> categories = [];

  @override
  void initState() {
    super.initState();
    loadCategories();
  }

  void loadCategories() async {
    try {
      List<TournamentCategory> loadedCategories = await Services().getAllCategories(
        widget.tournament.torNrId!,
      );
      print('Loaded Categories: $loadedCategories');
      setState(() {
        categories = loadedCategories;
      });
    } catch (error) {
      print("Error loading categories: $error");
    }
  }

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
                child: Text("Criar categoria")),
          SizedBox(height: 16),
          Expanded(child: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(16.0),
                child: ListTile(
                  title: Text(categories[index].catTxNome != null ? categories[index].catTxNome! : 'Categoria sem nome'),
                  onTap: (){

                  },
                ),
              );
            }
          )
          )
          ]
        )
      )
    );
  }
}
