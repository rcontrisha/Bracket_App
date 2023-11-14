import 'package:fincore/pages/loanprospect/widget/header_loanprospect.dart';
import 'package:fincore/routes/app_pages.dart';
import 'package:flutter/material.dart';

class LoanProspect extends StatefulWidget {
  const LoanProspect({super.key});

  @override
  State<LoanProspect> createState() => _LoanProspectState();
}

class _LoanProspectState extends State<LoanProspect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 248, 255),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              height: 50,
              color: Colors.white,
              margin: const EdgeInsets.only(top: 16),
              child: const HeaderLoanProspect()),
          Container(
            height: 8,
            color: const Color.fromARGB(255, 245, 248, 255),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text(
                      "Jaya Motor",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    Spacer(),
                    Text(
                      "20 Jul 2023, 08:22 WIBr",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 6, 90, 168)),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.only(top: 8),
                  child: Container(
                    width: 77,
                    height: 25,
                    padding: const EdgeInsets.only(
                        top: 4, bottom: 4, left: 8, right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 232, 245,
                          233), // Set your desired background color
                    ),
                    child: const Text(
                      "Assigned",
                      style: TextStyle(
                        color: Color.fromARGB(255, 32, 163, 148),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Domicilie Address",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 82, 82, 82)),
                ),
                const Text(
                  "Jl. RAYA BOGOR 23 NO 12B",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Kelurahan",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 82, 82, 82)),
                ),
                const Text(
                  "Cibinong Raya",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Column(
                      children: [
                        Icon(
                          Icons.other_houses_rounded,
                          color: Color.fromARGB(255, 6, 90, 168),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Entity",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Container(
                      width: 2, // Customize the width of the divider
                      height: 40, // Customize the height of the divider
                      color: Colors.grey, // Customize the color of the divider
                    ),
                    const Column(
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: Color.fromARGB(255, 32, 163, 148),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Application",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Container(
                      width: 2, // Customize the width of the divider
                      height: 40, // Customize the height of the divider
                      color: Colors.grey, // Customize the color of the divider
                    ),
                    const Column(
                      children: [
                        Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Delete",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Container(
                      width: 2, // Customize the width of the divider
                      height: 40, // Customize the height of the divider
                      color: Colors.grey, // Customize the color of the divider
                    ),
                    const Column(
                      children: [
                        Icon(
                          Icons.folder,
                          color: Color.fromARGB(255, 165, 6, 168),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "To Order",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text(
                      "Ridwan AAm",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    Spacer(),
                    Text(
                      "20 Jul 2023, 08:22 WIBr",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 6, 90, 168)),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.only(top: 8),
                  child: Container(
                    width: 77,
                    height: 25,
                    padding: const EdgeInsets.only(
                        top: 4, bottom: 4, left: 8, right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 232, 245,
                          233), // Set your desired background color
                    ),
                    child: const Text(
                      "Assigned",
                      style: TextStyle(
                        color: Color.fromARGB(255, 32, 163, 148),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Domicilie Address",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 82, 82, 82)),
                ),
                const Text(
                  "Jl. RAYA BOGOR 23 NO 12B",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Kelurahan",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 82, 82, 82)),
                ),
                const Text(
                  "Cibinong Raya",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.menuperson);
                      },
                      child: const Column(
                        children: [
                          Icon(
                            Icons.people,
                            color: Color.fromARGB(255, 6, 90, 168),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Person",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 2, // Customize the width of the divider
                      height: 40, // Customize the height of the divider
                      color: Colors.grey, // Customize the color of the divider
                    ),
                    const Column(
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: Color.fromARGB(255, 32, 163, 148),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Application",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Container(
                      width: 2, // Customize the width of the divider
                      height: 40, // Customize the height of the divider
                      color: Colors.grey, // Customize the color of the divider
                    ),
                    const Column(
                      children: [
                        Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Delete",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Container(
                      width: 2, // Customize the width of the divider
                      height: 40, // Customize the height of the divider
                      color: Colors.grey, // Customize the color of the divider
                    ),
                    const Column(
                      children: [
                        Icon(
                          Icons.folder,
                          color: Color.fromARGB(255, 165, 6, 168),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "To Order",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            color: const Color.fromARGB(255, 245, 248, 255),
            child: Container(
              width: 100,
              // height: 25,
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 16, right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color.fromARGB(255, 32, 163, 148),
                // Set your desired background color
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.addloan);
                },
                child: const Row(
                  children: [
                    Icon(Icons.add_circle_outline_rounded, color: Colors.white),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Add",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
