import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const ButtonPrimary({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsets.only(top: 14, bottom: 14, left: 16, right: 16),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 6, 90, 168),
            borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
