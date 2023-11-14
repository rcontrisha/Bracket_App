import 'package:fincore/pages/loanprospect/widget/header_menu_person.dart';
import 'package:flutter/material.dart';

class MenuPerson extends StatefulWidget {
  const MenuPerson({super.key});

  @override
  State<MenuPerson> createState() => _MenuPersonState();
}

class _MenuPersonState extends State<MenuPerson> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 7, vsync: this);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 248, 255),
      body: Column(
        children: [
          const HeaderMenuPerson(),
          Container(
            decoration: const BoxDecoration(
                border: Border(top: BorderSide(width: 1, color: Colors.grey))),
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            child: TabBar(
              controller: tabController,
              isScrollable: true,
              labelPadding: const EdgeInsets.symmetric(horizontal: 28),
              tabs: const [
                Tab(
                  child: Text(
                    "Personal",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "Address",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "Other Contact",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "Supouse",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "Capacity",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "Employment",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "Self Employed",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.blue,
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 3),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rizki Bili",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 12),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Individual Prospect",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 10),
                  ),
                ]),
          ),
          Expanded(
              child: TabBarView(
            controller: tabController,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    const Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Name ( Same With Identity Card )"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("Name ( Same With Identity Card )"),
                      ),
                    ),
                    const Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("NIK"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("NIK"),
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: const Row(
                          children: [
                            Text("Gender"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color:
                                      const Color.fromARGB(255, 246, 246, 246),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 6),
                                child: const Text(
                                  "Laki - Laki",
                                  style: TextStyle(color: Colors.grey),
                                )),
                            const SizedBox(
                              width: 4,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color:
                                      const Color.fromARGB(255, 246, 246, 246),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 6),
                                child: const Text(
                                  "Wanita",
                                  style: TextStyle(color: Colors.grey),
                                )),
                          ],
                        ),
                      ),
                    ),
                    const Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Birth Place"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("Birth Place"),
                      ),
                    ),
                    const Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Mother Name"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("Mother Name"),
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: const Row(
                          children: [
                            Text("Material Status"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color:
                                      const Color.fromARGB(255, 246, 246, 246),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 6),
                                child: const Text(
                                  "Single",
                                  style: TextStyle(color: Colors.grey),
                                )),
                            const SizedBox(
                              width: 4,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color:
                                      const Color.fromARGB(255, 246, 246, 246),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 6),
                                child: const Text(
                                  "Marries",
                                  style: TextStyle(color: Colors.grey),
                                )),
                            const SizedBox(
                              width: 4,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color:
                                      const Color.fromARGB(255, 246, 246, 246),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 6),
                                child: const Text(
                                  "Divorce",
                                  style: TextStyle(color: Colors.grey),
                                )),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: const Row(
                          children: [
                            Icon(
                              Icons.map_rounded,
                              color: Colors.blue,
                              size: 30,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text("Domicilie Address Location"),
                            SizedBox(
                              width: 20,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  color: Colors.blue,
                                  size: 20,
                                ),
                                Text(
                                  "Show",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            )
                          ],
                        ),
                        subtitle: Container(
                          margin: const EdgeInsets.only(
                              left: 50, top: 4, bottom: 10),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("lat : -1237654345"),
                              SizedBox(
                                height: 4,
                              ),
                              Text("lat : -1237654345")
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Text(
                          "Identity Address",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                        subtitle: Text(
                          "Bekasi RT 1 RW 4, Naggerwer Cibingong Kab. Bogor Jawa Barat",
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        ),
                      ),
                    ),
                    const Row(
                      children: [
                        Expanded(
                          child: Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: ListTile(
                              title: Row(
                                children: [
                                  Text("Area Code"),
                                  Icon(
                                    Icons.star,
                                    color: Colors.red,
                                    size: 8,
                                  )
                                ],
                              ),
                              subtitle: Text(
                                "62",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: ListTile(
                              title: Row(
                                children: [
                                  Text("Phone number"),
                                  Icon(
                                    Icons.star,
                                    color: Colors.red,
                                    size: 8,
                                  )
                                ],
                              ),
                              subtitle: Row(
                                children: [
                                  Icon(
                                    Icons.phone,
                                    size: 18,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "89078977",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Mobile Phone"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Icon(
                              Icons.phone_android,
                              size: 18,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text("084280908887"),
                          ],
                        ),
                      ),
                    ),
                    const Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Email"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Icon(
                              Icons.email_outlined,
                              size: 18,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text("aammail@gmail.com"),
                          ],
                        ),
                      ),
                    ),
                    const Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                          title: Row(
                            children: [
                              Text("Occupation On ID"),
                              Icon(
                                Icons.star,
                                color: Colors.red,
                                size: 8,
                              )
                            ],
                          ),
                          subtitle: Text("Pegawai")),
                    ),
                    const Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                          title: Row(
                            children: [
                              Text("NPWP No"),
                              Icon(
                                Icons.star,
                                color: Colors.red,
                                size: 8,
                              )
                            ],
                          ),
                          subtitle: Text("0987654345")),
                    ),
                    const Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                          title: Row(
                            children: [
                              Text("Education"),
                              Icon(
                                Icons.star,
                                color: Colors.red,
                                size: 8,
                              )
                            ],
                          ),
                          subtitle: Text("SARJANA SRATA 1/D4")),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 24, bottom: 8),
                      color: Colors.white,
                      child: ListTile(
                        title: const Row(
                          children: [
                            Icon(
                              Icons.map_rounded,
                              color: Colors.blue,
                              size: 30,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text("Home Adress"),
                            Spacer(),
                            Row(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 10,
                                ),
                                Text(
                                  "Aktif",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            )
                          ],
                        ),
                        subtitle: Container(
                          margin: const EdgeInsets.only(
                              left: 50, right: 30, top: 4, bottom: 10),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Bekasi RT 02 RW 04 Kemang Kemang Kab. Bogor Jawa Barat"),
                              SizedBox(
                                height: 4,
                              ),
                              Text("lat : -1237654345"),
                              SizedBox(
                                height: 4,
                              ),
                              Text("lat : -1237654345")
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Column(
                            children: [
                              Icon(
                                Icons.edit_note_sharp,
                                color: Color.fromARGB(255, 6, 90, 168),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Detail",
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
                            color: Colors
                                .grey, // Customize the color of the divider
                          ),
                          const Column(
                            children: [
                              Icon(
                                Icons.delete,
                                color: Colors.red,
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
                            color: Colors
                                .grey, // Customize the color of the divider
                          ),
                          const Column(
                            children: [
                              Icon(
                                Icons.location_pin,
                                color: Colors.green,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Show",
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
                            color: Colors
                                .grey, // Customize the color of the divider
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.other_houses,
                                color: Colors.blue[800],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                "Ass Dom addr",
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
                            color: Colors
                                .grey, // Customize the color of the divider
                          ),
                          const Column(
                            children: [
                              Icon(
                                Icons.card_membership_sharp,
                                color: Colors.purple,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Ass Id addr",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.phone_android,
                                color: Colors.blue,
                                size: 18,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Mobile Phone"),
                              Spacer(),
                              Icon(
                                Icons.edit,
                                color: Colors.blue,
                                size: 18,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                Icons.delete,
                                color: Colors.blue,
                                size: 18,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 25),
                            child: const Text(
                              "0812 8900 7773",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    const Card(
                      color: Color.fromARGB(255, 221, 235, 250),
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Icon(
                              Icons.info,
                              color: Color.fromARGB(255, 1, 115, 203),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Flexible(
                              child: Text(
                                "Jika spouse sudah terdaftar pilih datanya dengan klik menu Biz partner dibawah.",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 1, 115, 203),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Spouse Name"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("Spouse Name"),
                      ),
                    ),
                    const Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Nik No"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("Nik No"),
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: const Row(
                          children: [
                            Text("Gender"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color:
                                      const Color.fromARGB(255, 246, 246, 246),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 6),
                                child: const Text(
                                  "Laki - Laki",
                                  style: TextStyle(color: Colors.grey),
                                )),
                            const SizedBox(
                              width: 4,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color:
                                      const Color.fromARGB(255, 246, 246, 246),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 6),
                                child: const Text(
                                  "Wanita",
                                  style: TextStyle(color: Colors.grey),
                                )),
                          ],
                        ),
                      ),
                    ),
                    const Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Birth Place"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("Birth Place"),
                      ),
                    ),
                    const Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Birth Date"),
                            SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Icon(Icons.calendar_month),
                            Text("Birth Date"),
                          ],
                        ),
                      ),
                    ),
                    const Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Address"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("Address"),
                      ),
                    ),
                    const Row(
                      children: [
                        Expanded(
                          child: Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: ListTile(
                              title: Row(
                                children: [
                                  Text("RT"),
                                  Icon(
                                    Icons.star,
                                    color: Colors.red,
                                    size: 8,
                                  )
                                ],
                              ),
                              subtitle: Text(
                                "RT",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: ListTile(
                              title: Row(
                                children: [
                                  Text("RW"),
                                  Icon(
                                    Icons.star,
                                    color: Colors.red,
                                    size: 8,
                                  )
                                ],
                              ),
                              subtitle: Text(
                                "RW",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Province"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("Province"),
                      ),
                    ),
                    const Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Kab/Kota"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("Kab/Kota"),
                      ),
                    ),
                    const Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Kecamatan"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("Kecamatan"),
                      ),
                    ),
                    const Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Kelurahan"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("Kelurahan"),
                      ),
                    ),
                    const Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Occupation ID"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("Occupation ID"),
                      ),
                    ),
                    const Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("NPWP no"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("NPWP no"),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 3),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.people,
                                  color: Colors.blue,
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Biz Partner",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                ),
                              ]),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Cleare Form",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                ),
                              ]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("House Status"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("House Status"),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Lama Tinggal (Tahun)"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("Lama Tinggal (Tahun)"),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Occupation"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("Occupation"),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Occupation"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("Occupation"),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Lama Kerja/Usaha (Tahun)"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("Lama Kerja/Usaha (Tahun)"),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Monthly Income"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("Monthly Income"),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Mothly Spouse Income"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("Mothly Spouse Income"),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Monthly Other Income"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("Monthly Other Income"),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Jumlah Tanggungan"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("Jumlah Tanggungan"),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Monthly Expense"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("Monthly Expense"),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Industry Sector"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("Industry Sector"),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Industry SubSector"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("Industry SubSector"),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Golongan"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("Golongan"),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Category"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("Category"),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Relation"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("Relation"),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 24, bottom: 8),
                      color: Colors.white,
                      child: ListTile(
                        title: const Row(
                          children: [
                            Icon(
                              Icons.cases_outlined,
                              color: Colors.blue,
                              size: 30,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text("Restoran"),
                            Spacer(),
                            Row(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 10,
                                ),
                                Text(
                                  "Aktif",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            )
                          ],
                        ),
                        subtitle: Container(
                          margin: const EdgeInsets.only(
                              left: 50, right: 30, top: 4, bottom: 10),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Usaha Dagang"),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Bekasi RT 02 RW 04 Kemang Kemang Kab. Bogor Jawa Barat",
                                style: TextStyle(color: Colors.blue),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Column(
                            children: [
                              Icon(
                                Icons.edit_note_sharp,
                                color: Color.fromARGB(255, 6, 90, 168),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Detail",
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
                            color: Colors
                                .grey, // Customize the color of the divider
                          ),
                          const Column(
                            children: [
                              Icon(
                                Icons.delete,
                                color: Colors.red,
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    const Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Bussiness Name"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("Bussiness Name"),
                      ),
                    ),
                    const Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("NIB No"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("NIB No"),
                      ),
                    ),
                    const Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Industry Sector"),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("Industry Sector"),
                      ),
                    ),
                    const Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Industry SubSector"),
                            SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("Industry SubSector"),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      // padding: EdgeInsets.only(top: 24, bottom: 8),
                      color: Colors.white,
                      child: ListTile(
                        title: const Row(
                          children: [
                            Icon(
                              Icons.map_rounded,
                              color: Colors.blue,
                              size: 30,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text("Bussiness Location Address"),
                            Spacer(),
                            Row(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 10,
                                ),
                                Text(
                                  "Aktif",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            )
                          ],
                        ),
                        subtitle: Container(
                          margin: const EdgeInsets.only(
                              left: 50, right: 30, top: 4, bottom: 10),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Bekasi RT 02 RW 04 Kemang Kemang Kab. Bogor Jawa Barat"),
                              SizedBox(
                                height: 4,
                              ),
                              Text("lat : -1237654345"),
                              SizedBox(
                                height: 4,
                              ),
                              Text("lat : -1237654345")
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Row(
                      children: [
                        Expanded(
                          child: Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: ListTile(
                              title: Row(
                                children: [
                                  Text("Area Code"),
                                  Icon(
                                    Icons.star,
                                    color: Colors.red,
                                    size: 8,
                                  )
                                ],
                              ),
                              subtitle: Text(
                                "Area Code",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: ListTile(
                              title: Row(
                                children: [
                                  Text("Phone number"),
                                  Icon(
                                    Icons.star,
                                    color: Colors.red,
                                    size: 8,
                                  )
                                ],
                              ),
                              subtitle: Row(
                                children: [
                                  Icon(
                                    Icons.phone,
                                    size: 18,
                                    color: Colors.blue,
                                  ),
                                  Text(
                                    "Phone number",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Since (Year)"),
                            SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("Since (Year)"),
                      ),
                    ),
                    const Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Jumlah Karyawan"),
                            SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("Jumlah Karyawan"),
                      ),
                    ),
                    const Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Daily Omzet"),
                            SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("Daily Omzet"),
                      ),
                    ),
                    const Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Other Info"),
                            SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 8,
                            )
                          ],
                        ),
                        subtitle: Text("Other Info"),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 3),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Cleare Form",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                ),
                              ]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
