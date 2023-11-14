import 'package:fincore/pages/loanprospect/widget/header_addloanprospect.dart';
import 'package:flutter/material.dart';

class AddLoanProspect extends StatefulWidget {
  const AddLoanProspect({super.key});

  @override
  State<AddLoanProspect> createState() => _AddLoanProspectState();
}

class _AddLoanProspectState extends State<AddLoanProspect> {
  List<String> list = <String>['', 'One', 'Two', 'Three', 'Four'];
  @override
  Widget build(BuildContext context) {
    String dropdownValue = list.first;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 248, 255),
      body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        HeaderAddLoanProspect(),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                padding:
                    EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                width: double.infinity,
                color: Colors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Text(
                            "Prospect Type",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w400),
                          ),
                          Icon(
                            Icons.star,
                            size: 10,
                            color: Colors.red,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "Choose Type",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                          ),
                          const Spacer(),
                          DropdownButton<String>(
                              value: dropdownValue,
                              icon: const Icon(
                                  Icons.keyboard_arrow_down_outlined),
                              elevation: 16,
                              style: const TextStyle(color: Colors.grey),
                              onChanged: (String? value) {
                                // This is called when the user selects an item.
                                setState(() {
                                  dropdownValue = value!;
                                });
                              },
                              items: list.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList()),
                        ],
                      ),
                    ]),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8, left: 16, right: 16),
                width: double.infinity,
                color: Colors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Text(
                            "Prospect Name",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w400),
                          ),
                          Icon(
                            Icons.star,
                            size: 10,
                            color: Colors.red,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "Choose Type",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                          ),
                          const Spacer(),
                          DropdownButton<String>(
                              value: dropdownValue,
                              icon: const Icon(
                                  Icons.keyboard_arrow_down_outlined),
                              elevation: 16,
                              style: const TextStyle(color: Colors.grey),
                              onChanged: (String? value) {
                                // This is called when the user selects an item.
                                setState(() {
                                  dropdownValue = value!;
                                });
                              },
                              items: list.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList()),
                        ],
                      ),
                    ]),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8, left: 16, right: 16),
                width: double.infinity,
                color: Colors.white,
                child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Domicilie Address",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w400),
                          ),
                          Icon(
                            Icons.star,
                            size: 10,
                            color: Colors.red,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Domicilie Address",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                    ]),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 176,
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, left: 16, right: 16),
                    color: Colors.white,
                    child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Domicilie RT",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w400),
                              ),
                              Icon(
                                Icons.star,
                                size: 10,
                                color: Colors.red,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Domicilie RT",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                          ),
                        ]),
                  ),
                  Container(
                    width: 176,
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, left: 16, right: 16),
                    color: Colors.white,
                    child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Domicilie RT",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w400),
                              ),
                              Icon(
                                Icons.star,
                                size: 10,
                                color: Colors.red,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Domicilie RT",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                          ),
                        ]),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8, left: 16, right: 16),
                width: double.infinity,
                color: Colors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Text(
                            "Kelurahan",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w400),
                          ),
                          Icon(
                            Icons.star,
                            size: 10,
                            color: Colors.red,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "Choose Kelurahan",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                          ),
                          const Spacer(),
                          DropdownButton<String>(
                              value: dropdownValue,
                              icon: const Icon(
                                  Icons.keyboard_arrow_down_outlined),
                              elevation: 16,
                              style: const TextStyle(color: Colors.grey),
                              onChanged: (String? value) {
                                // This is called when the user selects an item.
                                setState(() {
                                  dropdownValue = value!;
                                });
                              },
                              items: list.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList()),
                        ],
                      ),
                    ]),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8, left: 16, right: 16),
                width: double.infinity,
                color: Colors.white,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.map_sharp,
                      color: Color.fromARGB(255, 6, 90, 168),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Domicilie Address Location',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'lat: -',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'long: -',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: Color.fromARGB(255, 6, 90, 168),
                          size: 15,
                        ),
                        Text(
                          "Pin Location",
                          style: TextStyle(
                              fontSize: 10,
                              color: Color.fromARGB(255, 6, 90, 168),
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ])),
    );
  }
}
