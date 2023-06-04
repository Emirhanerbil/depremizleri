import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
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
              Icon(Icons.home, color: Colors.white),
              Icon(Icons.person)
            ],
            backgroundColor: Color(0XFFFF969C)),
        key: scaffoldKey,
        backgroundColor: Color(0XFFE3E7DF),
        drawer: Drawer(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 60),
            ListTile(
                leading: CircleAvatar(
                    child: Image.asset("assets/images/profile.png")),
                title: Text("Ezgi Güney")),
            ListTile(
                leading: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.text_snippet, color: Colors.black)),
                title: Text("Yazılarım")),
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
          Column(children: [
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
                          child: mainText("Post Title")),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.notifications))
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15),
                  color: Color(0xffFF969C),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 20),
                      CircleAvatar(
                          radius: 20,
                          child: Image.asset("assets/images/profile.png")),
                      SizedBox(width: 20),
                      titles("Ezgi Güney", 16),
                    ],
                  ),
                ),
                Container(
                  color: Color(0xffEAE7E7),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15, top: 5),
                        alignment: Alignment.topLeft,
                        child: Text("Ezgi Güney",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold)),
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 100,
                            margin:
                                EdgeInsets.only(right: 15, left: 15, top: 5),
                            child: Text(
                              "Jorem ipsum dolor ur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.",
                              style: TextStyle(
                                  fontFamily: "Poppings",
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 50, left: 300),
                                width: 80,
                                alignment: Alignment.bottomRight,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      titles("10", 16),
                                      IconButton(
                                          onPressed: () {},
                                          icon:
                                              Icon(Icons.heart_broken_rounded))
                                    ]),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      color: Color(0xffEAE7E7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 10),
                          Icon(Icons.subdirectory_arrow_right_rounded),
                          SizedBox(width: 10),
                          CircleAvatar(
                              radius: 20,
                              child: Image.asset("assets/images/profile.png")),
                          SizedBox(width: 20),
                          titles("Ezgi Güney", 16),
                        ],
                      ),
                    ),
                    Container(
                      color: Color(0xffEAE7E7),
                      child: Container(
                        height: 100,
                        margin: EdgeInsets.only(right: 15, left: 15, top: 5),
                        child: Text(
                          "Jorem ipsum dolor ur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.",
                          style: TextStyle(
                              fontFamily: "Poppings",
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ])
        ]));
  }

  Text titles(String text, double fontsize) {
    return Text(text,
        style: TextStyle(
            fontFamily: "Poppins",
            fontSize: fontsize,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold));
  }

  Text mainText(String text) {
    return Text(text,
        style: TextStyle(
            color: Color(0XFFFF6F77),
            fontSize: 20,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w800));
  }

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }
}