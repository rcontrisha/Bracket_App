import 'package:fincore/component/background_auth.dart';
import 'package:fincore/component/button_primary.dart';
import 'package:fincore/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerificationCode extends StatefulWidget {
  const VerificationCode({super.key});

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const BackgroundAuth(
              judul1: "Verification",
              judul2: "Code",
              text:
                  "Enter your verification code that we sent you through your email ari****1@mail.com."),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
            child: Column(
              children: [
                OtpTextField(
                  clearText: true,
                  numberOfFields: 4,
                  borderColor: const Color(0xFF512DA8),
                  showFieldAsBox: true,
                  fieldWidth: 60,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  onCodeChanged: (String code) {
                    print(code);
                    //handle validation or checks here
                  },
                  // runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    setState(() {});
                  }, // end onSubmit
                ),
                const SizedBox(
                  height: 40,
                ),
                ButtonPrimary(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.newpassword);
                    },
                    text: "Set New Password"),
                const SizedBox(
                  height: 40,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Code validity period 05:00",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: Color.fromARGB(255, 144, 144, 144),
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    Text("05:00",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: Color.fromARGB(255, 9, 115, 196),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
