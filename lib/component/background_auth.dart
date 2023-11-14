import 'package:flutter/material.dart';

class BackgroundAuth extends StatelessWidget {
  final String judul1;
  final String judul2;
  final String text;

  const BackgroundAuth(
      {super.key,
      required this.judul1,
      required this.judul2,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: double.infinity,
          height: 307.0,
          child: Image.asset("assets/images/Background.png", fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 150, left: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                judul1,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                judul2,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal),
              )
            ],
          ),
        )
      ],
    );
  }
}
