import 'package:flutter/material.dart';
import 'package:tournament_bracket/tournament_bracket.dart';

class DoubleElimination extends StatefulWidget {
  const DoubleElimination({
    Key? key,
    required this.namaTurnamen,
    required this.tipeOlahraga,
    required this.jumlahPartisipan,
    required this.formatTurnamen,
    required this.teamNames,
  }) : super(key: key);

  final String namaTurnamen;
  final String tipeOlahraga;
  final String jumlahPartisipan;
  final String formatTurnamen;
  final List<String> teamNames;

  @override
  State<DoubleElimination> createState() => _DoubleEliminationState();
}

class _DoubleEliminationState extends State<DoubleElimination> {
  late List<List<Team>> upperBracket;
  late List<List<Team>> lowerBracket;

  @override
  void initState() {
    super.initState();
    var teams = _generateTeams(int.parse(widget.jumlahPartisipan));
    upperBracket = teams[0];
    lowerBracket = teams[1];
  }

  List<List<List<Team>>> _generateTeams(int totalParticipants) {
    List<List<Team>> upper = [];
    List<List<Team>> lower = [];

    // Membuat bracket hanya jika ada cukup partisipan
    if (totalParticipants < 2) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(
                "Jumlah partisipan tidak mencukupi untuk membuat bracket."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
      return [[], []];
    }

    // Generate upper bracket
    for (int i = 0; i < 5; i++) {
      if (i == 0) {
        upper.add(List.generate(totalParticipants,
            (index) => Team(name: widget.teamNames[index], age: index + 1)));
      } else {
        int stageParticipants = totalParticipants ~/ (2 << (i - 1));
        upper.add(List.generate(stageParticipants,
            (index) => Team(name: 'Winner Stage ${i + 1}', age: index + 1)));
      }
    }

    // Generate lower bracket
    for (int i = 0; i < 4; i++) {
      int stageParticipants = totalParticipants ~/ (2 << i);
      lower.add(List.generate(stageParticipants,
          (index) => Team(name: 'Loser Stage ${i + 1}', age: index + 1)));
    }

    return [upper, lower];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Double-Elimination Brackets"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text("Nama Turnamen: ${widget.namaTurnamen}"),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Jenis Olahraga: ${widget.tipeOlahraga}"),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Jumlah Partisipan: ${widget.jumlahPartisipan}"),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Format Pertandingan: ${widget.formatTurnamen}"),
                    ],
                  ),
                ),
                Expanded(
                  child: TBracket<Team>(
                    containt: upperBracket,
                    space: 20,
                    hadderBuilder: (context, index, count) => Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        'Round ${index + 1}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    teamNameBuilder: (team) => BracketText(
                      text: team.name,
                      textStyle: TextStyle(color: Colors.black),
                    ),
                    context: context,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Lower Bracket"),
                    ],
                  ),
                ),
                Expanded(
                  child: TBracket<Team>(
                    containt: lowerBracket,
                    space: 20,
                    hadderBuilder: (context, index, count) => Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        'Round ${index + 1}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    teamNameBuilder: (team) => BracketText(
                      text: team.name,
                      textStyle: TextStyle(color: Colors.black),
                    ),
                    context: context,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Team {
  Team({
    required this.name,
    required this.age,
  });

  final int age;
  String name;
}
