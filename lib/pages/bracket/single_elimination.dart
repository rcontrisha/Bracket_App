import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tournament_bracket/tournament_bracket.dart';

class SingleElimination extends StatefulWidget {
  const SingleElimination({
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
  State<SingleElimination> createState() => _SingleEliminationState();
}

class _SingleEliminationState extends State<SingleElimination> {
  late List<List<Team>> allTeams;
  late Key bracketKey = UniqueKey();

  @override
  void initState() {
    super.initState();
    allTeams = _generateTeams(int.parse(widget.jumlahPartisipan));
  }

  List<List<Team>> _generateTeams(int totalParticipants) {
    List<List<Team>> teams = [];
    for (int i = 0; i < 5; i++) {
      if (i == 0) {
        teams.add(List.generate(totalParticipants,
            (index) => Team(name: widget.teamNames[index], age: index + 1)));
      } else {
        int stageParticipants = totalParticipants ~/ (2 << (i - 1));
        teams.add(List.generate(stageParticipants,
            (index) => Team(name: 'Winner Stage ${i + 1}', age: index + 1)));
      }
    }
    return teams;
  }

  void _shuffleTeams() {
    setState(() {
      for (int i = 0; i < allTeams.length; i++) {
        allTeams[i].shuffle();
      }
    });
    _refreshBracket();
    _updateTeamsInDatabase(); // Panggil fungsi untuk memperbarui urutan tim di database
  }

  void _updateTeamsInDatabase() async {
    try {
      final database = await openDatabase(
        join(await getDatabasesPath(), 'tournament_database.db'),
        version: 1,
      );

      for (int i = 0; i < allTeams.length; i++) {
        for (int j = 0; j < allTeams[i].length; j++) {
          // Menghitung ID turnamen berdasarkan indeks loop
          int tournamentId = (i * allTeams[i].length) + j + 1;

          // Update urutan tim di database sesuai dengan urutan yang baru setelah pengacakan
          await database.rawUpdate(
            'UPDATE tournaments SET team_names = ? WHERE id = ?',
            [allTeams[i][j].name, tournamentId],
          );

          // Debug print untuk menampilkan data yang diupdate
          print(
              'Updated tournament ID: $tournamentId, Team names: ${allTeams[i][j].name}');
        }
      }
    } catch (e) {
      print('Error updating teams in database: $e');
    }
  }

  void _refreshBracket() {
    setState(() {
      bracketKey = UniqueKey();
    });
  }

  void _updateTeamName(int stage, int index, String newName) {
    setState(() {
      allTeams[stage][index].name = newName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Single-Elimination Brackets"),
      ),
      body: Column(
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
              key: bracketKey,
              space: 200 / 4,
              separation: 150,
              stageWidth: 200,
              onSameTeam: (team1, team2) {
                if (team1 != null && team2 != null) {
                  return team1.name == team2.name;
                }
                return false;
              },
              hadderBuilder: (context, index, count) => Container(
                alignment: Alignment.center,
                width: 220,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(width: 1),
                ),
                child:
                    Text("Stage ${count - 1 == index ? 'winner' : index + 1}"),
              ),
              connectorColor: const Color.fromARGB(144, 244, 67, 54),
              winnerConnectorColor: Colors.green,
              teamContainerDecoration:
                  BracketBoxDecroction(borderRadious: 15, color: Colors.black),
              stageIndicatorBoxDecroction: BracketStageIndicatorBoxDecroction(
                borderRadious: const Radius.circular(15),
                primaryColor: Color.fromARGB(15, 247, 123, 123),
                secondaryColor: Color.fromARGB(15, 194, 236, 147),
              ),
              containt: allTeams,
              teamNameBuilder: (Team t) {
                return BracketText(
                  text: t.name,
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
              onContainerTapDown: (Team? model, TapDownDetails tapDownDetails) {
                if (model == null) {
                  print(null);
                } else {
                  print(model.name);
                }
              },
              context: context,
            ),
          ),
          SizedBox(
            height: 8,
          )
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
