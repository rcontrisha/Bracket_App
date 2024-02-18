import 'package:flutter/material.dart';
import 'package:fincore/component/background_auth.dart';
import 'package:fincore/component/button_primary.dart';
import 'package:fincore/model/tournament_model.dart';
import 'package:fincore/pages/bracket/double_elimination.dart';
import 'package:fincore/pages/bracket/single_elimination.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  static late Database _database;
  static bool _initialized = false;

  Future<Database> get database async {
    if (!_initialized) {
      await initDatabase();
    }
    return _database;
  }

  // Fungsi untuk inisialisasi database
  Future<void> initDatabase() async {
    if (!_initialized) {
      final path = await getDatabasesPath();
      _database = await openDatabase(
        join(path, 'tournament_database.db'),
        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE tournaments('
            'id INTEGER PRIMARY KEY AUTOINCREMENT, '
            'user_id INTEGER, '
            'tournament_name TEXT, '
            'sport_type TEXT, '
            'number_of_participants INTEGER, '
            'tournament_format TEXT, '
            'team_names TEXT)',
          );
        },
        version: 1,
      );
      _initialized = true;
      print('Database initialized.');
    }
  }

  // Fungsi untuk menyimpan turnamen ke dalam database
  Future<void> saveTournament(Tournament tournament) async {
    final db = await database;
    await db.insert(
      'tournaments',
      tournament.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}

class CreateBracket extends StatefulWidget {
  const CreateBracket({Key? key}) : super(key: key);

  @override
  State<CreateBracket> createState() => _CreateBracketState();
}

class _CreateBracketState extends State<CreateBracket> {
  final namaTurnamenController = TextEditingController();
  final tipeOlahragaController = TextEditingController();
  final jumlahPartisipanController = TextEditingController();
  String dropdownValueFormatTurnamen = 'Single-Elimination Bracket';
  List<TextEditingController> teamControllers = [];
  late final DatabaseHelper dbHelper;
  late int _userId;

  @override
  void initState() {
    super.initState();
    _getUserIdFromSharedPreferences();
    // Inisialisasi controller input nama tim
    for (int i = 0; i < 1; i++) {
      teamControllers.add(TextEditingController());
    }
    // Inisialisasi database helper
    dbHelper = DatabaseHelper();
    // Inisialisasi database
    dbHelper.initDatabase().then((_) {
      print('Database initialized in initState.');
    }).catchError((error) {
      print('Error initializing database: $error');
    });
  }

  @override
  void dispose() {
    // Hapus controller saat widget di dispose
    for (var controller in teamControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  int? _parseJumlahPartisipan(String? text) {
    try {
      return text != null ? int.parse(text) : null;
    } catch (e) {
      return null;
    }
  }

  void _updateForm() {
    // Update form state
    setState(() {
      // Hapus controller tim yang tidak diperlukan
      teamControllers.removeWhere((controller) =>
          teamControllers.indexOf(controller) >=
          _parseJumlahPartisipan(jumlahPartisipanController.text)!);

      // Tambahkan controller tim baru jika diperlukan
      for (int i = teamControllers.length;
          i < _parseJumlahPartisipan(jumlahPartisipanController.text)!;
          i++) {
        teamControllers.add(TextEditingController());
      }
    });
  }

  // Metode untuk mengambil ID user dari SharedPreferences
  Future<void> _getUserIdFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _userId = prefs.getInt('userId') ??
        0; // Ambil ID user, jika tidak ada, default ke 0
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BackgroundAuth(judul2: "Create your tournament"),
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Nama Turnamen",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Color.fromARGB(255, 144, 144, 144),
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: namaTurnamenController,
                    decoration: InputDecoration(
                      hintText: "Nama Turnamen",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text("Tipe Olahraga",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Color.fromARGB(255, 144, 144, 144),
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: tipeOlahragaController,
                    decoration: InputDecoration(
                      hintText: "Tipe Olahraga",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text("Jumlah Partisipan",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Color.fromARGB(255, 144, 144, 144),
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: jumlahPartisipanController,
                    decoration: InputDecoration(
                      hintText: "Jumlah Partisipan",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (_) => _updateForm(),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text("Format Turnamen",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Color.fromARGB(255, 144, 144, 144),
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: 200,
                    child: DropdownButton<String>(
                      value: dropdownValueFormatTurnamen,
                      elevation: 16,
                      isExpanded: true,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        width: double.infinity,
                        color: const Color.fromRGBO(237, 237, 237, 1),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          dropdownValueFormatTurnamen = value!;
                        });
                      },
                      items: [
                        DropdownMenuItem<String>(
                          value: 'Single-Elimination Bracket',
                          child: Text('Single-Elimination Bracket'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Double-Elimination Bracket',
                          child: Text('Double-Elimination Bracket'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  // Input nama-nama tim
                  for (int i = 0; i < teamControllers.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextField(
                        controller: teamControllers[i],
                        decoration: InputDecoration(
                          hintText: "Nama Tim ${i + 1}",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 40,
                  ),
                  ButtonPrimary(
                    onTap: () async {
                      // Memasukkan input nama tim ke dalam list
                      List<String> teamNames = teamControllers
                          .map((controller) => controller.text)
                          .toList();

                      // Membuat objek turnamen dari input
                      String teamNamesString = teamNames
                          .join(', '); // Convert list to comma-separated string
                      Tournament tournament = Tournament(
                        id: 0, // ID akan diisi oleh database
                        userId:
                            _userId, // Ganti dengan ID user yang sedang login
                        tournamentName: namaTurnamenController.text,
                        sportType: tipeOlahragaController.text,
                        numberOfParticipants: _parseJumlahPartisipan(
                            jumlahPartisipanController.text)!,
                        tournamentFormat: dropdownValueFormatTurnamen,
                        teamNames:
                            teamNamesString, // Assign the string instead of the list
                      );

                      // Menyimpan turnamen ke dalam database
                      await dbHelper.saveTournament(tournament);

                      // Debug print untuk mengecek data turnamen yang tersimpan
                      print('Turnamen tersimpan:');
                      print('Nama Turnamen: ${tournament.tournamentName}');
                      print('Tipe Olahraga: ${tournament.sportType}');
                      print(
                          'Jumlah Partisipan: ${tournament.numberOfParticipants}');
                      print('Format Turnamen: ${tournament.tournamentFormat}');
                      print('Nama-nama Tim: ${tournament.teamNames}');

                      // Navigasi ke halaman bracket sesuai format turnamen yang dipilih
                      if (dropdownValueFormatTurnamen ==
                          'Single-Elimination Bracket') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SingleElimination(
                              namaTurnamen: namaTurnamenController.text,
                              tipeOlahraga: tipeOlahragaController.text,
                              jumlahPartisipan: jumlahPartisipanController.text,
                              formatTurnamen: dropdownValueFormatTurnamen,
                              teamNames: teamNames,
                            ),
                          ),
                        );
                      } else if (dropdownValueFormatTurnamen ==
                          'Double-Elimination Bracket') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoubleElimination(
                              namaTurnamen: namaTurnamenController.text,
                              tipeOlahraga: tipeOlahragaController.text,
                              jumlahPartisipan: jumlahPartisipanController.text,
                              formatTurnamen: dropdownValueFormatTurnamen,
                              teamNames: teamNames,
                            ),
                          ),
                        );
                      }
                    },
                    text: "Save",
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
