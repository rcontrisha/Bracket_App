import 'package:fincore/component/background_auth.dart';
import 'package:fincore/component/button_primary.dart';
import 'package:fincore/component/footer_copyright.dart';
import 'package:fincore/component/text_field.dart';
import 'package:fincore/routes/app_pages.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BackgroundAuth(
                judul1: "Sign In to your ",
                judul2: "Account",
                text: "Sign in account"),
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Username",
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
                      controller: usernameController,
                      hintext: "Username",
                      obscuretext: false),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text("Password",
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
                      controller: passwordController,
                      hintext: "Password",
                      obscuretext: true),
                  const SizedBox(
                    height: 24,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.forgotpassword);
                      },
                      child: const Text("Forgot Password",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            color: Color.fromARGB(255, 9, 115, 196),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ButtonPrimary(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.main);
                      },
                      text: "Login"),
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
      ),
    );
  }
}
