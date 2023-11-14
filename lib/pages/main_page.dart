import 'package:fincore/component/costom_navbar.dart';
import 'package:fincore/pages/homepage/home.dart';
// import 'package:fincore/pages/loanprospect/loan_prospect.dart';
import 'package:fincore/pages/profilepage/profile_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  List<Widget> pages = [HomePage(), ProfilePage()];

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
