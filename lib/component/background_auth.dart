import 'package:flutter/material.dart';

class BackgroundAuth extends StatelessWidget {
  final String judul2;

  const BackgroundAuth({
    super.key,
    required this.judul2,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: double.infinity,
          height: 100.0,
          child: Image.asset("assets/images/Background.png", fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                judul2,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal),
              ),
            ],
          ),
        )
      ],
    );
  }
}
