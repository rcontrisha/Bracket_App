import 'package:flutter/material.dart';
import 'package:fincore/routes/app_pages.dart';
import 'package:fincore/component/text_field.dart'; // Import TextFieldBase
import 'package:fincore/component/button_primary.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart'; // Import ButtonPrimary

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late Database _database;
  late SharedPreferences _prefs;
  int? _userId;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _initDatabase();
    _initSharedPreferences();
  }

  Future<void> _initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'user_database.db'),
      onCreate: (db, version) {
        db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, username TEXT, password TEXT)',
        );
        db.execute(
          'CREATE TABLE login_history(id INTEGER PRIMARY KEY, user_id INTEGER, login_time TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    _userId = _prefs.getInt('userId');
  }

  Future<void> _loginUser(
      BuildContext context, String username, String password) async {
    final result = await _database.rawQuery(
      'SELECT id FROM users WHERE username = ? AND password = ?',
      [username, password],
    );
    if (result.isNotEmpty) {
      final userId = result.first['id'] as int;
      await _prefs.setInt('userId', userId);
      setState(() {
        _userId = userId;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login successful')),
      );
      Navigator.pushNamed(context, Routes.main);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid username or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height *
                  0.3, // Mengatur tinggi background sekitar 30% dari tinggi layar
              child: BackgroundLogin(
                judul2: "Tournament Bracket",
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      'Login', // Teks "Login"
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.0),
                  TextFieldBase(
                    controller: _usernameController,
                    hintext: 'Username',
                    obscuretext: false,
                  ),
                  SizedBox(height: 16.0),
                  TextFieldBase(
                    controller: _passwordController,
                    hintext: 'Password',
                    obscuretext: true,
                  ),
                  SizedBox(height: 32.0),
                  ButtonPrimary(
                    onTap: () async {
                      final username = _usernameController.text;
                      final password = _passwordController.text;
                      await _loginUser(context, username, password);
                    },
                    text: 'Login',
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.register);
                      },
                      child: Text('Register'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _database.close();
    super.dispose();
  }
}

class BackgroundLogin extends StatelessWidget {
  final String judul2;

  const BackgroundLogin({
    super.key,
    required this.judul2,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity, // Menyesuaikan tinggi layar
          child: Image.asset("assets/images/Background.png", fit: BoxFit.cover),
        ),
        Positioned(
          top: 40, // Menyesuaikan posisi teks "Welcome Back"
          left: 24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Row(
                children: [
                  Icon(Icons.person,
                      color: Colors.white), // Menambahkan ikon user
                  SizedBox(width: 10),
                  Text(
                    'Welcome Back', // Teks sambutan
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35),
              Text(
                'Welcome to BracketMaster!', // Judul aplikasi
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28, // Mengubah ukuran teks menjadi 28
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width *
                    0.8, // Lebar teks maksimal 80% dari lebar layar
                child: Text(
                  'With BracketMaster, easily create and manage tournaments '
                  'with different formats like single and double elimination. '
                  'Get started today!',
                  // Deskripsi lebih singkat tentang aplikasi
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
