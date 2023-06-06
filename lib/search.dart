import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'models/User.dart';

class Search extends StatefulWidget {
  Search({super.key, required this.users, required this.arama});

  final String arama;

  final List<User> users;

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
            height: 57,
            selectedIndex: 3,
            destinations: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "/text",
                    );
                  },
                  icon: Icon(Icons.text_snippet, color: Colors.white)),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/newPost");
                  },
                  icon: Icon(Icons.add)),
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.pushNamed(context, "/home");
                },
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Navigator.pushNamed(context, "/profile");
                },
              )
            ],
            backgroundColor: Color(0XFFE3E7DF)),
        drawer: Drawer(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 60),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/profile");
              },
              child: ListTile(
                  leading: CircleAvatar(
                      child: Image.asset("assets/images/profile.png")),
                  title: Text("Ezgi Güney")),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/text");
              },
              child: ListTile(
                  leading: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.text_snippet, color: Colors.black)),
                  title: Text("Yazılarım")),
            ),
            ListTile(
                leading: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.reply, color: Colors.black)),
                title: Text("Cevaplarım")),
            ListTile(
                leading: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.thumb_up, color: Colors.black)),
                title: Text("Beğendiklerim")),
            ListTile(
                leading: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.settings, color: Colors.black)),
                title: Text("Ayarlar")),
            Container(
              height: 400,
              alignment: Alignment.bottomCenter,
              child: ListTile(
                  leading: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.logout, color: Colors.black)),
                  title: Text("Çıkış Yap")),
            )
          ]),
        ),
        body: Column(children: [
          Column(
            children: [
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
                            child: mainText("Yazılarım")),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.notifications))
                      ],
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 15),
                width: 313,
                height: 50,
                child: Row(children: [
                  Icon(Icons.search),
                  SizedBox(width: 10),
                  Text("Ara")
                ]),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white),
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
              itemCount: widget.users.length,
              separatorBuilder: (context, index) {
                if (widget.users[index].content.contains(widget.arama)) {
                  return Container(
                    margin: EdgeInsets.only(
                        left: 30, right: 30, bottom: 10, top: 10),
                    height: 1,
                    color: Colors.black38,
                  );
                } else {
                  return Container();
                }
              },
              itemBuilder: (context, index) {
                if (widget.users[index].content.contains(widget.arama)) {
                  return Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.users[index].title,
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
                                  widget.users[index].content,
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
                                    child: Image.asset(
                                        "assets/images/profile.png"),
                                  ),
                                  Text(widget.users[index].name +
                                      " " +
                                      widget.users[index].surname),
                                ],
                              ),
                              Icon(Icons.heart_broken_rounded),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return Stack(
                    children: [Container()],
                  );
                }
              },
            ),
          ),
        ]));
  }

  Container categoryContainer(String text) {
    return Container(
      alignment: Alignment.center,
      height: 25,
      width: 95,
      decoration:
          const BoxDecoration(shape: BoxShape.rectangle, color: Colors.white),
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

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  Text mainText(String text) {
    return Text(text,
        style: TextStyle(
            color: Color(0XFFFF6F77),
            fontSize: 20,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w800));
  }
}
