import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'models/User.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({
    super.key,
    required this.users,
  });
  final List<User> users;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        bottomNavigationBar: NavigationBar(
            height: 57,
            selectedIndex: 3,
            destinations: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/text");
                  },
                  icon: Icon(Icons.text_snippet)),
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
                icon: Icon(Icons.person, color: Colors.white),
                onPressed: () {
                  Navigator.pushNamed(context, "/profile");
                },
              )
            ],
            backgroundColor: Color(0XFFE3E7DF)),
        backgroundColor: Color(0XFFE3E7DF),
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
                  margin: EdgeInsets.only(top: 20),
                  child: Text(widget.users.length.toString() + " Yazı"))
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
          Container(
            height: 300,
            child: Expanded(
              child: ListView.separated(
                itemCount: widget.users.length,
                separatorBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                        left: 30, right: 30, bottom: 10, top: 10),
                    height: 1,
                    color: Colors.black38,
                  );
                },
                itemBuilder: (context, index) {
                  User user = widget.users[index];
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
                                user.title,
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
                                  user.content,
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
                                        "assets/images/profile.jpg"),
                                  ),
                                  Text(user.name + " " + user.surname),
                                ],
                              ),
                              Icon(Icons.heart_broken_rounded),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
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
