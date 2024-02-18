import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/tournament_model.dart';

class DatabaseHelper {
  static late Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    // Jika database belum dibuat, maka kita akan membuatnya
    _database = await initDatabase();
    return _database;
  }

  // Fungsi untuk inisialisasi database
  Future<Database> initDatabase() async {
    final path = await getDatabasesPath();
    return openDatabase(
      join(path, 'turnament_database.db'),
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
