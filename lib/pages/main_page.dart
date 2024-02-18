import 'package:fincore/component/costom_navbar.dart';
import 'package:fincore/pages/bracket/create_bracket.dart';
import 'package:fincore/pages/homepage/home.dart';
import 'package:fincore/pages/saved%20bracket/tournament_list.dart';
import 'package:flutter/material.dart';
import 'auth/login_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  List<Widget> pages = [HomePage(), CreateBracket(), TournamentListPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: CostomNavbar(
        onClick: (i) {
          setState(() {
            currentIndex = i;
          });
        },
      ),
    );
  }
}
