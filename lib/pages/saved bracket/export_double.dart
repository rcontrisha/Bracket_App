import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tournament_bracket/tournament_bracket.dart';

class ExportDouble extends StatefulWidget {
  const ExportDouble({
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
  State<ExportDouble> createState() => _ExportDoubleState();
}

class _ExportDoubleState extends State<ExportDouble> {
  late List<List<Team>> upperBracket;
  late List<List<Team>> lowerBracket;
  final GlobalKey _upperGlobalKey = GlobalKey();
  final GlobalKey _lowerGlobalKey = GlobalKey();

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
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveBracketAsImage,
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                "Detail Turnamen",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildDetailTurnamen(),
              SizedBox(height: 20),
              Text("Upper Bracket", style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              RepaintBoundary(
                key: _upperGlobalKey,
                child: Container(
                  color: Colors.white,
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
              ),
              SizedBox(height: 20),
              Text("Lower Bracket", style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              RepaintBoundary(
                key: _lowerGlobalKey,
                child: Container(
                  color: Colors.white,
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailTurnamen() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text("Nama Turnamen: ${widget.namaTurnamen}"),
          SizedBox(height: 5),
          Text("Tipe Olahraga: ${widget.tipeOlahraga}"),
          SizedBox(height: 5),
          Text("Jumlah Partisipan: ${widget.jumlahPartisipan}"),
          SizedBox(height: 5),
          Text("Format Turnamen: ${widget.formatTurnamen}"),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Future<void> _saveBracketAsImage() async {
    final upperImage = await _captureScreenshot(_upperGlobalKey);
    final lowerImage = await _captureScreenshot(_lowerGlobalKey);

    final directory = await getExternalStorageDirectory();
    final bracketDirectory =
        Directory('${directory!.path}/${widget.namaTurnamen}');
    await bracketDirectory.create(recursive: true);

    final imagePathUpper = '${bracketDirectory.path}/upper.png';
    final imagePathLower = '${bracketDirectory.path}/lower.png';
    final File fileUpper = File(imagePathUpper);
    final File fileLower = File(imagePathLower);
    await fileUpper.writeAsBytes(upperImage!);
    await fileLower.writeAsBytes(lowerImage!);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Gambar atas disimpan di: $imagePathUpper\n'
            'Gambar bawah disimpan di: $imagePathLower'),
      ),
    );
  }

  Future<Uint8List?> _captureScreenshot(GlobalKey key) async {
    try {
      RenderRepaintBoundary boundary =
          key.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      return byteData!.buffer.asUint8List();
    } catch (e) {
      print("Error capturing screenshot: $e");
      return null;
    }
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
