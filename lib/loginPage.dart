import 'package:depremizleri/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class loginPage extends StatelessWidget {
  loginPage({super.key});
  String sifre = "";
  String eposta = "";

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffE3E7DF),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SvgPicture.asset("assets/images/shapeLeftTop.svg"),
        SizedBox(height: 50),
        Center(
          child: Text(
            "Giriş Yap",
            style: GoogleFonts.poppins(
                color: Color(0xffFF6F77),
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: 40, bottom: 20, top: 20),
            child: SvgPicture.asset("assets/images/login.svg")),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 30),
            width: 300,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.white)),
            child: TextField(
              onSubmitted: (value) {
                eposta = value;
              },
              style: TextStyle(),
              decoration: InputDecoration(
                hintText: "E-posta",
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 10),
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 30),
            width: 300,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.white)),
            child: TextField(
              obscureText: true,
              onSubmitted: (value) {
                sifre = value;
              },
              style: TextStyle(),
              decoration: InputDecoration(
                hintText: "Şifre",
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 10),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 80, top: 30),
          width: 250,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xffFF6F77)),
          child: TextButton(
            onPressed: () {
              if (sifre == "123" && eposta == "deneme@gmail.com") {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Home()));
              } else {
                showAlertDialog(context);
              }
            },
            child: Text(
              "GİRİŞ YAP",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 80, top: 10),
          child: Row(
            children: [
              Text(
                "Henüz bir hesabınız yok mu?",
                style: GoogleFonts.poppins(fontWeight: FontWeight.normal),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Kayıt ol",
                    style: GoogleFonts.poppins(
                        color: Color(0xffFF6F77), fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        )
      ]),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hatalı Şifre/E-mail'),
          content: Text(
              'Girdiğiniz şifre veya e-mail yanlış. Lütfen tekrar deneyin.'),
          actions: [
            TextButton(
              child: Text('Tamam'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
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
