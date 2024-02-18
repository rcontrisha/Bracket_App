import 'package:fincore/component/icon_text_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 11, bottom: 16),
                child: Image.asset(
                  "assets/images/Logo Fincore.jpg",
                  alignment: Alignment.topLeft,
                  width: 100,
                  height: 35,
                ),
              ),
              Stack(
                children: [
                  Container(
                      width: double.infinity,
                      height: 114,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromARGB(255, 1, 115, 203),
                      ),
                      child: Image.asset(
                        "assets/images/Background_Image.png",
                        alignment: Alignment.topRight,
                      )),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(bottom: 16, left: 16),
                          child: const Text(
                            "Dashboard Activity",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "2",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Total Turnamen",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.white),
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                      color: Colors.white,
                                      size: 12,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 24, right: 24),
                              child: Image.asset("assets/images/Line 128.png"),
                            ),
                            Column(
                              children: [
                                Text(
                                  "10",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Total Users",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.white),
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                      color: Colors.white,
                                      size: 12,
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                "Fincore Brackets App",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    color: Colors.black),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconTextWidget(
                      iconAsset: "assets/icons/iconFincore_Loan  Prospect.png",
                      text: 'Turnamen Brackets'),
                  SizedBox(
                    width: 24,
                  ),
                  IconTextWidget(
                      iconAsset: "assets/icons/iconFincore_Loan   Order.png",
                      text: 'Single Eleminations'),
                  SizedBox(
                    width: 24,
                  ),
                  IconTextWidget(
                      iconAsset: "assets/icons/iconFincore_Biz  Partner.png",
                      text: 'Biz Partner'),
                  SizedBox(
                    width: 24,
                  ),
                  IconTextWidget(
                      iconAsset:
                          "assets/icons/iconFincore_Post  Disbursement.png",
                      text: 'Many Sports'),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
