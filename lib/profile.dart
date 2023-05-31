import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
          height: 57,
          selectedIndex: 3,
          destinations: [
            Icon(Icons.text_snippet),
            Icon(Icons.add),
            Icon(Icons.home),
            Icon(Icons.person, color: Colors.white)
          ],
        ),
        backgroundColor: Color(0XFFE3E7DF),
        drawer: Drawer(),
        body: Column(children: [
          Container(
            color: Color(0xFfFF969C),
            height: 300,
            child: Column(children: [
              Stack(
                children: [
                  SvgPicture.asset("assets/images/shapeLeftTop.svg"),
                  Container(
                    margin: EdgeInsets.only(top: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () => openDrawer(),
                            icon: Icon(Icons.menu)),
                        Container(
                            margin: EdgeInsets.only(right: 30, left: 30),
                            child: mainText("Profil")),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.notifications))
                      ],
                    ),
                  ),
                ],
              ),
              Center(
                child: CircleAvatar(
                  radius: 50,
                  child: Image.asset("assets/images/profile.png"),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20), child: Text("12 Yazı"))
            ]),
          ),
          SizedBox(height: 10),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                categoryContainer("Yazılarım", Color(0xffFF969C)),
                categoryContainer("Cevaplarım", Colors.white)
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Borem ipsum ",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Icon(Icons.arrow_right_sharp)
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Torem ipsum dolor sit amet consectetur borem...",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  child:
                                      Image.asset("assets/images/profile.jpg"),
                                ),
                                Text("Profil İsmi"),
                              ],
                            ),
                            Icon(Icons.heart_broken_rounded),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Borem ipsum ",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Icon(Icons.arrow_right_sharp)
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Torem ipsum dolor sit amet consectetur borem...",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  child:
                                      Image.asset("assets/images/profile.jpg"),
                                ),
                                Text("Profil İsmi"),
                              ],
                            ),
                            Icon(Icons.heart_broken_rounded),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Borem ipsum ",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Icon(Icons.arrow_right_sharp)
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Torem ipsum dolor sit amet consectetur borem...",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  child:
                                      Image.asset("assets/images/profile.jpg"),
                                ),
                                Text("Profil İsmi"),
                              ],
                            ),
                            Icon(Icons.heart_broken_rounded),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Borem ipsum ",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Icon(Icons.arrow_right_sharp)
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Torem ipsum dolor sit amet consectetur borem...",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  child:
                                      Image.asset("assets/images/profile.jpg"),
                                ),
                                Text("Profil İsmi"),
                              ],
                            ),
                            Icon(Icons.heart_broken_rounded),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Borem ipsum ",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Icon(Icons.arrow_right_sharp)
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Torem ipsum dolor sit amet consectetur borem...",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  child:
                                      Image.asset("assets/images/profile.jpg"),
                                ),
                                Text("Profil İsmi"),
                              ],
                            ),
                            Icon(Icons.heart_broken_rounded),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }

  Text mainText(String text) {
    return Text(text,
        style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w800));
  }

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  Container categoryContainer(String text, Color choosencolor) {
    return Container(
      alignment: Alignment.center,
      height: 25,
      width: 95,
      decoration: BoxDecoration(shape: BoxShape.rectangle, color: choosencolor),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.black,
            fontFamily: "Poppins",
            fontSize: 12,
            fontWeight: FontWeight.w500),
        textAlign: TextAlign.center,
      ),
    );
  }
}
