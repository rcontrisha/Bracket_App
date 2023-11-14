import 'package:fincore/component/background_auth.dart';
import 'package:fincore/component/button_primary.dart';
import 'package:fincore/component/text_field.dart';
import 'package:flutter/material.dart';

import '../../routes/app_pages.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final currentPassword = TextEditingController();
  final newPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const BackgroundAuth(
              judul1: "Set your new",
              judul2: "Password",
              text: "Write down your new password."),
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text("New Password",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: Color.fromARGB(255, 144, 144, 144),
                        )),
                    Icon(
                      Icons.star,
                      color: Colors.red,
                      size: 6,
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFieldBase(
                    controller: currentPassword,
                    hintext: "New Password",
                    obscuretext: true),
                const SizedBox(height: 40),
                const Row(
                  children: [
                    Text("Re-type New Password",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: Color.fromARGB(255, 144, 144, 144),
                        )),
                    Icon(
                      Icons.star,
                      color: Colors.red,
                      size: 6,
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFieldBase(
                    controller: currentPassword,
                    hintext: "Re-type New Password",
                    obscuretext: true),
                const SizedBox(
                  height: 40,
                ),
                ButtonPrimary(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.verification);
                    },
                    text: "Save"),
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
