import 'package:fincore/routes/app_pages.dart';
import 'package:flutter/material.dart';

class CostomNavbar extends StatelessWidget {
  const CostomNavbar({
    super.key,
    required this.onClick,
  });

  final void Function(int index) onClick;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: SizedBox(
        height: 70,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        onClick(0);
                      },
                      icon: const Icon(
                        Icons.home,
                        color: Color.fromARGB(255, 103, 102, 102),
                      ),
                    ),
                    const Text("Home",
                        style: TextStyle(
                          color: Color.fromARGB(255, 103, 102, 102),
                          fontWeight: FontWeight.w700,
                        )),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // onClick(1);
                        Navigator.pushNamed(context, Routes.loan);
                      },
                      child: Image.asset("assets/icons/Icon-Task.png"),
                    ),
                    const Text("Loan Prospect",
                        style: TextStyle(
                          color: Color.fromARGB(255, 103, 102, 102),
                          fontWeight: FontWeight.w700,
                        )),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        onClick(2);
                      },
                      icon: const Icon(
                        Icons.person_rounded,
                        color: Color.fromARGB(255, 103, 102, 102),
                      ),
                    ),
                    const Text("Profile",
                        style: TextStyle(
                          color: Color.fromARGB(255, 103, 102, 102),
                          fontWeight: FontWeight.w700,
                        )),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
