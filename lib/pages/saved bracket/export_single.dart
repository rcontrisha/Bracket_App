import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tournament_bracket/tournament_bracket.dart';
import '../../model/tournament_model.dart';

class ExportSingle extends StatefulWidget {
  const ExportSingle({
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
  State<ExportSingle> createState() => _ExportSingleState();
}

class _ExportSingleState extends State<ExportSingle> {
  late List<List<Team>> allTeams;
  final GlobalKey _globalKey = GlobalKey();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Single-Elimination Brackets"),
        actions: [
          IconButton(
            icon: Icon(Icons.shuffle),
            onPressed: _shuffleTeams,
          ),
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => _saveBracketAsImage(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: RepaintBoundary(
            key: _globalKey,
            child: Container(
              color: Colors.white, // Set background color to white
              child: Column(
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
                  Padding(
                    padding: const EdgeInsets.all(16.0),
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(width: 1),
                        ),
                        child: Text(
                            "Stage ${count - 1 == index ? 'winner' : index + 1}"),
                      ),
                      connectorColor: const Color.fromARGB(144, 244, 67, 54),
                      winnerConnectorColor: Colors.green,
                      teamContainerDecoration: BracketBoxDecroction(
                          borderRadious: 15, color: Colors.black),
                      stageIndicatorBoxDecroction:
                          BracketStageIndicatorBoxDecroction(
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
                      onContainerTapDown:
                          (Team? model, TapDownDetails tapDownDetails) {
                        if (model == null) {
                          print(null);
                        } else {
                          print(model.name);
                        }
                      },
                      onLineIconPress: ((team1, team2, tapDownDetails) {
                        if (team1 != null && team2 != null) {
                          // Simulate match result (for demo purposes)
                          print("${team1.name} and ${team2.name}");
                        } else {
                          print(null);
                        }
                      }),
                      context: context,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _shuffleTeams() {
    setState(() {
      for (int i = 0; i < allTeams.length; i++) {
        allTeams[i].shuffle();
      }
      _refreshBracket();
      _updateTeamsInDatabase();
    });
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
    print(
        "Bracket refreshed"); // Debug print untuk memastikan pembaruan bracket dipanggil
  }

  Future<void> _saveBracketAsImage(BuildContext context) async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    // Dapatkan direktori penyimpanan eksternal
    late Directory directory;
    if (Platform.isAndroid) {
      directory = (await getExternalStorageDirectory())!;
    } else if (Platform.isWindows) {
      directory = await getApplicationDocumentsDirectory();
    }

    final externalPath = directory.path;

    // Tentukan direktori tujuan
    final destinationDirectory =
        '$externalPath/${widget.namaTurnamen}'; // Ganti dengan nama folder yang diinginkan

    // Buat direktori jika belum ada
    final savedDir = Directory(destinationDirectory);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }

    // Simpan gambar di direktori penyimpanan eksternal
    final imagePath = '$destinationDirectory/${widget.namaTurnamen}.png';
    File(imagePath).writeAsBytesSync(pngBytes);

    // Tampilkan pesan yang memberitahu pengguna bahwa gambar telah disimpan
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Gambar disimpan di: $imagePath'),
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
