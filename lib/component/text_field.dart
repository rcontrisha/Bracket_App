import 'package:flutter/material.dart';

class TextFieldBase extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final bool obscuretext;
  const TextFieldBase(
      {super.key,
      required this.controller,
      required this.hintext,
      required this.obscuretext});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscuretext,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color.fromRGBO(237, 237, 237, 1), width: 3),
              borderRadius: BorderRadius.circular(8)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue)),
          fillColor: Colors.white,
          filled: true,
          hintText: hintext,
          hintStyle: const TextStyle(
              color: Color.fromARGB(255, 82, 82, 82),
              fontSize: 12,
              fontWeight: FontWeight.w400)),
    );
  }
}
