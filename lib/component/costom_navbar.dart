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
                    IconButton(
                      onPressed: () {
                        onClick(1);
                      },
                      icon: const Icon(
                        Icons.amp_stories_rounded,
                        color: Color.fromARGB(255, 103, 102, 102),
                      ),
                    ),
                    const Text("Create Brackets",
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
                        Icons.add_moderator_rounded,
                        color: Color.fromARGB(255, 103, 102, 102),
                      ),
                    ),
                    const Text("Brackets",
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
