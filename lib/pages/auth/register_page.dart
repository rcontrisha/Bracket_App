import 'package:flutter/material.dart';
import 'package:fincore/routes/app_pages.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:fincore/component/text_field.dart'; // Import TextFieldBase
import 'package:fincore/component/button_primary.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late Database _database;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'user_database.db'),
      onCreate: (db, version) {
        db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, username TEXT, password TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> _registerUser(String username, String password) async {
    await _database.transaction((txn) async {
      await txn.rawInsert(
        'INSERT INTO users(username, password) VALUES(?, ?)',
        [username, password],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: BackgroundLogin(
              judul2: "Create Account",
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
                    'Register',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
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
                    await _registerUser(username, password);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('User registered successfully')),
                    );
                  },
                  text: 'Register',
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.login);
                    },
                    child: Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        ],
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
