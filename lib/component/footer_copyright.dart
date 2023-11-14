import 'package:flutter/material.dart';

class FooterCopyright extends StatelessWidget {
  const FooterCopyright({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      '© 2023 Prawathiya Karsa Pradiptha. | All Rights Reserved.',
      style: TextStyle(
        color: Color.fromARGB(255, 117, 117, 117),
        fontSize: 12,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
      ),
    );
  }
}
