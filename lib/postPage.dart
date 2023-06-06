// ignore_for_file: must_be_immutable

import 'package:depremizleri/models/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PostPage extends StatefulWidget {
  PostPage({super.key, required this.post});
  final User post;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  TextEditingController commentController = TextEditingController();

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
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
                icon: Icon(Icons.home, color: Colors.white),
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
                          child: mainText(widget.post.title)),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.notifications))
                    ],
                  ),
                )
              ],
            ),
            Container(
              height: 550,
              child: Column(
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
                        titles(widget.post.title, 16),
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
                              margin:
                                  EdgeInsets.only(right: 15, left: 15, top: 5),
                              child: Text(widget.post.content,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.normal)),
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
                                        titles(
                                            widget.post.likes.toString(), 16),
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                if (widget.post.isliked) {
                                                  widget.post.likes -= 1;
                                                } else {
                                                  widget.post.likes += 1;
                                                }
                                                widget.post.isliked =
                                                    !widget.post.isliked;
                                              });
                                            },
                                            icon: FaIcon(widget.post.isliked
                                                ? FontAwesomeIcons.solidHeart
                                                : FontAwesomeIcons.heart))
                                      ]),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: widget.post.comments.length,
                        separatorBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                                left: 30, right: 30, bottom: 10, top: 10),
                            height: 1,
                            color: Colors.black38,
                          );
                        },
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 15),
                                color: Color(0xffEAE7E7),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 10),
                                    Icon(
                                        Icons.subdirectory_arrow_right_rounded),
                                    SizedBox(width: 10),
                                    CircleAvatar(
                                        radius: 20,
                                        child: Image.asset(
                                            "assets/images/profile.png")),
                                    SizedBox(width: 20),
                                    titles("Ezgi Güney", 16),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.bottomLeft,
                                color: Color(0xffEAE7E7),
                                child: Container(
                                  color: Color(0xffEAE7E7),
                                  padding: EdgeInsets.only(bottom: 20),
                                  margin: EdgeInsets.only(
                                      right: 15, left: 15, top: 5),
                                  child: Text(
                                    widget.post.comments[index],
                                    style: TextStyle(
                                        fontFamily: "RobotoMono",
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                        left: 10,
                        right: 10),
                    child: TextField(
                      controller: commentController,
                      decoration: InputDecoration(
                          hintText: "Yorum yaz",
                          suffixIcon: IconButton(
                            onPressed: () {
                              if (commentController.text.isNotEmpty) {
                                addComment(commentController.text);
                              }
                            },
                            icon: Icon(Icons.send),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ]),
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

  void addComment(String comment) {
    setState(() {
      widget.post.comments.add(comment);
    });
    commentController.clear();
  }
}
