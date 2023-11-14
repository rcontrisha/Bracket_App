import 'package:fincore/component/background_auth.dart';
import 'package:fincore/component/button_primary.dart';
import 'package:fincore/component/footer_copyright.dart';
import 'package:fincore/component/text_field.dart';
import 'package:fincore/routes/app_pages.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const BackgroundAuth(
              judul1: "Forgot your ",
              judul2: "Password ?",
              text: "Write down your registered email to reset the password"),
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Email",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      color: Color.fromARGB(255, 144, 144, 144),
                    )),
                const SizedBox(
                  height: 8,
                ),
                TextFieldBase(
                    controller: emailController,
                    hintext: "Email",
                    obscuretext: false),
                const SizedBox(
                  height: 24,
                ),
                ButtonPrimary(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.verification);
                    },
                    text: "Get New Password"),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Remember your password?",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: Color.fromARGB(255, 144, 144, 144),
                        )),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.login);
                      },
                      child: const Text("Back to Login",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            color: Color.fromARGB(255, 9, 115, 196),
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const Align(
                    alignment: Alignment.center, child: FooterCopyright()),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
