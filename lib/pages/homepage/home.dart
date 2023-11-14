import 'package:fincore/component/icon_text_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentSelection = 1;
  double _selectedPositionX = 16.0;
  final double _selectorWidth = 80;

  GlobalKey _key1 = GlobalKey();
  GlobalKey _key2 = GlobalKey();
  GlobalKey _key3 = GlobalKey();

  _selectedItem(int id) {
    _currentSelection = id;
    GlobalKey selectedGlobalKey;
    switch (id) {
      case 1:
        selectedGlobalKey = _key1;
        break;
      case 2:
        selectedGlobalKey = _key2;
        break;
      case 3:
        selectedGlobalKey = _key3;
        break;
      default:
        selectedGlobalKey = _key1;
    }
    _setWidgetPositionX(selectedGlobalKey);
    setState(() {});
  }

  _setWidgetPositionX(GlobalKey selectedKey) {
    final RenderBox? widgetRenderBox =
        selectedKey.currentContext?.findRenderObject() as RenderBox?;
    final widgetPosition = widgetRenderBox?.localToGlobal(Offset.zero);
    final widgetSize = widgetRenderBox?.size;
    // _selectedPositionX = widgetPosition!.dx;
    _selectedPositionX =
        widgetPosition!.dx - ((_selectorWidth - widgetSize!.width));
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _setWidgetPositionX(_key1));
  }

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
                            const Column(
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
                                      "Total Loan Prospect",
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
                            const Column(
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
                                      "Total Loan Order",
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
                "Layanan Fincore",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    color: Colors.black),
              ),
              const SizedBox(height: 24),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconTextWidget(
                      iconAsset: "assets/icons/iconFincore_Loan  Prospect.png",
                      text: 'Loan Prospect'),
                  SizedBox(
                    width: 24,
                  ),
                  IconTextWidget(
                      iconAsset: "assets/icons/iconFincore_Loan   Order.png",
                      text: 'Loan Order'),
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
                      text: 'Post Disbursement'),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Stack(children: [
                Container(
                  margin: const EdgeInsets.only(left: 20.0, bottom: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        key: _key1,
                        onTap: () => _selectedItem(1),
                        child: Text(
                          'Inbox',
                          style: TextStyle(
                              color: _currentSelection == 1
                                  ? Colors.blue
                                  : Colors.grey,
                              fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      InkWell(
                        key: _key2,
                        onTap: () => _selectedItem(2),
                        child: Text(
                          'Outbox',
                          style: TextStyle(
                              color: _currentSelection == 2
                                  ? Colors.blue
                                  : Colors.grey,
                              fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      InkWell(
                        key: _key3,
                        onTap: () => _selectedItem(3),
                        child: Text(
                          'Notification',
                          style: TextStyle(
                              color: _currentSelection == 3
                                  ? Colors.blue
                                  : Colors.grey,
                              fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.fastOutSlowIn,
                  left: _selectedPositionX,
                  bottom: 4.0,
                  child: Container(
                    width: _selectorWidth,
                    height: 5.0,
                    decoration: ShapeDecoration(
                        shape: const StadiumBorder(), color: Colors.blue[300]),
                  ),
                )
              ]),
              Container(
                margin: const EdgeInsets.only(top: 16),
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        style: BorderStyle.solid,
                        color: const Color.fromARGB(255, 237, 237, 237))),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dana Wijaya",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "1000053411311313",
                        style: TextStyle(
                            color: Color.fromARGB(255, 144, 144, 144),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Loan Otder No 101023ORD00001 need your approval",
                        style: TextStyle(
                            color: Color.fromARGB(255, 144, 144, 144),
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "01 Jun 2023 11:08 WIB - 22 h 32m",
                        style: TextStyle(
                            color: Color.fromARGB(255, 1, 115, 203),
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
