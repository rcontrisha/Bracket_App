import 'package:flutter/material.dart';

class HeaderMenuPerson extends StatefulWidget {
  const HeaderMenuPerson({super.key});

  @override
  State<HeaderMenuPerson> createState() => _HeaderMenuPersonState();
}

class _HeaderMenuPersonState extends State<HeaderMenuPerson> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 37, bottom: 16, left: 16, right: 16),
      color: Colors.white,
      child: const Row(
        children: [
          Icon(Icons.chevron_left),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Person"),
              SizedBox(
                height: 4,
              ),
              Text("1/10 Form")
            ],
          ),
          Spacer(),
          Icon(
            Icons.save,
            color: Color.fromARGB(255, 1, 115, 203),
          ),
        ],
      ),
    );
  }
}
