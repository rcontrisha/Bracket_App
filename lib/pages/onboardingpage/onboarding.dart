import 'package:fincore/component/button_primary.dart';
import 'package:fincore/routes/app_pages.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  void next() {
    Navigator.pushNamed(context, Routes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 64.0, left: 24, right: 24),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topRight,
                child: const Text(
                  "Fincore Brackets App",
                  style: TextStyle(
                      color: Color(0xFF757575),
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 58.56, bottom: 44.31),
                child: Image.asset('assets/images/Ilustarasi Work.jpg',
                    fit: BoxFit.cover),
              ),
              const Text(
                "Easy",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "Easy to generate Brackets Tournaments",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal),
              ),
              const SizedBox(
                height: 81,
              ),
              const Text(
                'Make your Tournament brackets',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
              const Text(
                'Easy To Use',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'make easy generatetournament brackets',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              ButtonPrimary(onTap: next, text: "Next"),
              const SizedBox(
                height: 60,
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
