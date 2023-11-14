import 'package:flutter/material.dart';

class HeaderLoanProspect extends StatelessWidget {
  const HeaderLoanProspect({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.chevron_left_sharp,
          color: Colors.black,
        ),
        SizedBox(
          width: 16,
        ),
        Text(
          "Loan Prospect",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        Spacer(),
        Icon(
          Icons.filter_alt,
          color: Colors.blue,
        ),
        SizedBox(
          width: 24,
        ),
        Icon(
          Icons.refresh_outlined,
          color: Colors.blue,
        ),
      ],
    );
  }
}
