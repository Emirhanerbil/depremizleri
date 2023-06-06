import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'models/User.dart';

// ignore: must_be_immutable
class newPostPage extends StatelessWidget {
  final Function(User) addPost;

  newPostPage({super.key, required this.addPost});
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                icon: Icon(Icons.add, color: Colors.white)),
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                child: TextField(
                  decoration: InputDecoration(hintText: "Başlık"),
                  controller: titleController,
                ),
              ),
              Container(
                height: 100,
                padding: EdgeInsets.only(left: 20),
                color: Colors.white,
                child: TextField(
                  controller: contentController,
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
                    IconButton(
                      icon: Icon(Icons.save_alt),
                      onPressed: () {
                        String isim = "Ezgi";
                        String soyisim = "Güney";
                        String title = titleController.text;
                        String content = contentController.text;
                        User user = User("1", isim, soyisim, title, content,
                            ["comment"], 0, false);
                        addPost(user);

                        Navigator.pop(context);
                      },
                    )
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
