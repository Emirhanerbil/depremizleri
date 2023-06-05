import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<Ogrenciler> tumOgrenciler = List.generate(
      500,
      (index) =>
          Ogrenciler(index, "isim: ${index + 1}", "soyisim: ${index + 1}"));

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
      key: scaffoldKey,
      backgroundColor: Color(0XFFE3E7DF),
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
                    margin: EdgeInsets.only(top: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () => openDrawer(),
                            icon: Icon(Icons.menu)),
                        Container(
                            margin: EdgeInsets.only(right: 30, left: 30),
                            child: mainText("Ana Sayfa")),
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
              Container(
                margin: EdgeInsets.only(top: 30, left: 40, right: 40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    categoryContainer("Bugün", Color(0XFFFF969C)),
                    categoryContainer("Beğendiklerim", Colors.white),
                    categoryContainer("Yazılarım", Colors.white),
                  ],
                ),
              ),
            ],
          ),
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
                                      Image.asset("assets/images/profile.png"),
                                ),
                                SizedBox(width: 10),
                                Text("Ezgi Güney"),
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
        ],
      ),
    );
  }

  Container categoryContainer(String text, Color color) {
    return Container(
      alignment: Alignment.center,
      height: 25,
      width: 95,
      decoration: BoxDecoration(shape: BoxShape.rectangle, color: color),
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

class Ogrenciler {
  final int id;
  final String isim;
  final String soyisim;

  Ogrenciler(this.id, this.isim, this.soyisim);
}
