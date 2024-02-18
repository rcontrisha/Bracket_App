import 'package:fincore/model/tournament_model.dart';
import 'package:fincore/pages/auth/login_page.dart';
import 'package:fincore/pages/bracket/double_elimination.dart';
import 'package:fincore/pages/saved%20bracket/export_double.dart';
import 'package:fincore/pages/saved%20bracket/export_single.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import '../../component/background_auth.dart';

class TournamentListPage extends StatefulWidget {
  @override
  _TournamentListPageState createState() => _TournamentListPageState();
}

class _TournamentListPageState extends State<TournamentListPage> {
  late List<Tournament> _tournaments = [];
  late int _userId; // Variabel untuk menyimpan ID user yang sedang login

  @override
  void initState() {
    super.initState();
    _getUserIdFromSharedPreferences();
    _getTournamentsFromDatabase();
  }

  // Metode untuk mengambil ID user dari SharedPreferences
  Future<void> _getUserIdFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _userId = prefs.getInt('userId') ??
        0; // Ambil ID user, jika tidak ada, default ke 0
  }

  Future<void> _getTournamentsFromDatabase() async {
    final database = await openDatabase(
      join(await getDatabasesPath(), 'tournament_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE tournaments(id INTEGER PRIMARY KEY, user_id INTEGER, tournament_name TEXT, sport_type TEXT, number_of_participants INTEGER, tournament_format TEXT, team_names TEXT)',
        );
      },
      version: 1,
    );

    final List<Map<String, dynamic>> tournamentMaps = await database.query(
        'tournaments',
        where: 'user_id = ?',
        whereArgs: [_userId]); // Filter turnamen berdasarkan ID user

    setState(() {
      _tournaments = List.generate(
        tournamentMaps.length,
        (i) {
          return Tournament.fromMap(tournamentMaps[i]);
        },
      );
    });

    // Debug print untuk memeriksa apakah data berhasil diambil
    print('Tournament count: ${_tournaments.length}');
    print('Tournaments: $_tournaments');
  }

  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userId'); // Hapus SharedPreferences "userId"

    // Kembali ke halaman login atau halaman awal aplikasi
    // Misalnya:
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  Future<void> _deleteTournament(int id) async {
    final database = await openDatabase(
      join(await getDatabasesPath(), 'tournament_database.db'),
    );
    await database.delete(
      'tournaments',
      where: 'id = ?',
      whereArgs: [id],
    );
    await _getTournamentsFromDatabase(); // Perbarui daftar turnamen setelah penghapusan
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tournaments != null && _tournaments.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BackgroundAuth(
                    judul2: "Your Tournament"), // Tambahkan latar belakang
                Expanded(
                  child: ListView.builder(
                    itemCount: _tournaments.length,
                    itemBuilder: (context, index) {
                      print(
                          'Index: $index, Tournaments length: ${_tournaments.length}');
                      // Pastikan bahwa index tidak melebihi panjang daftar _tournaments
                      if (index >= 0 && index < _tournaments.length) {
                        print(
                            'Tournament Name: ${_tournaments[index].tournamentName}');
                        print('Sport Type: ${_tournaments[index].sportType}');
                        print(
                            'Number of Participants: ${_tournaments[index].numberOfParticipants}');
                        print(
                            'Tournament Format: ${_tournaments[index].tournamentFormat}');
                        print('Team Names: ${_tournaments[index].teamNames}');
                        return Card(
                          elevation: 2, // Tambahkan efek bayangan pada card
                          margin: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8), // Beri margin
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8), // Beri padding pada ListTile
                            leading: Icon(
                                Icons.emoji_events), // Menggunakan ikon trophy
                            title: Text(
                              _tournaments[index].tournamentName,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 4), // Tambahkan spasi vertikal
                                Text(
                                  'Sport: ${_tournaments[index].sportType}',
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(height: 2), // Tambahkan spasi vertikal
                                Text(
                                  'Format: ${_tournaments[index].tournamentFormat}',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Delete Tournament'),
                                    content: Text(
                                        'Are you sure you want to delete this tournament?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          _deleteTournament(
                                              _tournaments[index].id!);
                                          Navigator.pop(context);
                                        },
                                        child: Text('Delete'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            onTap: () {
                              if (_tournaments[index].tournamentFormat ==
                                  "Single-Elimination Bracket") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ExportSingle(
                                      namaTurnamen:
                                          _tournaments[index].tournamentName,
                                      tipeOlahraga:
                                          _tournaments[index].sportType,
                                      jumlahPartisipan: _tournaments[index]
                                          .numberOfParticipants
                                          .toString(),
                                      formatTurnamen:
                                          _tournaments[index].tournamentFormat,
                                      teamNames: _tournaments[index]
                                          .teamNames
                                          .split(','),
                                    ),
                                  ),
                                );
                              } else if (_tournaments[index].tournamentFormat ==
                                  "Double-Elimination Bracket") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ExportDouble(
                                      namaTurnamen:
                                          _tournaments[index].tournamentName,
                                      tipeOlahraga:
                                          _tournaments[index].sportType,
                                      jumlahPartisipan: _tournaments[index]
                                          .numberOfParticipants
                                          .toString(),
                                      formatTurnamen:
                                          _tournaments[index].tournamentFormat,
                                      teamNames: _tournaments[index]
                                          .teamNames
                                          .split(','),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        );
                      } else {
                        // Tampilkan widget kosong jika indeks tidak valid
                        return SizedBox();
                      }
                    },
                  ),
                ),
              ],
            )
          : Center(
              child:
                  CircularProgressIndicator(), // Placeholder for loading indicator
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _logout(context);
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}
