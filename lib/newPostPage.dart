import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class newPostPage extends StatefulWidget {
  const newPostPage({super.key});

  @override
  State<newPostPage> createState() => _newPostPageState();
}

class _newPostPageState extends State<newPostPage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
          height: 57,
          selectedIndex: 3,
          destinations: [
            Icon(Icons.text_snippet, color: Colors.white),
            Icon(Icons.add),
            Icon(Icons.home),
            Icon(Icons.person)
          ],
          backgroundColor: Color(0XFFFF969C)),
      key: scaffoldKey,
      backgroundColor: Color(0XFFE3E7DF),
      drawer: Drawer(),
      body: Column(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  SvgPicture.asset("assets/images/shapeLeftTop.svg"),
                  Container(
                    margin: EdgeInsets.only(top: 60, bottom: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () => openDrawer(),
                            icon: Icon(Icons.menu)),
                        Container(
                            margin: EdgeInsets.only(right: 30, left: 30),
                            child: mainText("Yeni Yazı")),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.notifications))
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                color: Colors.white,
                child:
                    TextField(decoration: InputDecoration(hintText: "Başlık")),
              ),
              Container(
                height: 100,
                padding: EdgeInsets.only(left: 20),
                color: Colors.white,
                child: TextField(
                  expands: true,
                  maxLines: null,
                  minLines: null,
                  decoration: InputDecoration(
                      hintText: "İçerik", border: InputBorder.none),
                ),
              ),
              Container(
                height: 50,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.camera_alt_outlined),
                    Icon(Icons.camera_indoor_rounded),
                    Icon(Icons.text_format_sharp),
                    Icon(Icons.emoji_emotions_outlined)
                  ],
                ),
              )
            ],
          ),
        ],
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
