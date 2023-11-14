import 'package:flutter/material.dart';

class HeaderAddLoanProspect extends StatelessWidget {
  const HeaderAddLoanProspect({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.white,
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: const Row(
        children: [
          Icon(
            Icons.chevron_left_sharp,
            color: Colors.black,
          ),
          SizedBox(
            width: 16,
          ),
          Text(
            "New Prospect",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          Spacer(),
          Icon(
            Icons.file_open_rounded,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
