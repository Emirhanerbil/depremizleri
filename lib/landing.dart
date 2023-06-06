import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class landing extends StatelessWidget {
  const landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFE3E7DF),
      body: Column(children: [
        Row(
          children: [SvgPicture.asset("assets/images/shapeLeftTop.svg")],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(

                // color: Colors.red,
                child: SvgPicture.asset("assets/images/landing.svg")),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(top: 60),
                child: const Text("DEPREM İZLERİ",
                    style: TextStyle(
                        color: Color(0xffFF6F77),
                        fontSize: 36.76,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Poppins"),
                    textAlign: TextAlign.center)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              margin: EdgeInsets.only(top: 20),
              child: const Text(
                maxLines: 5,
                textAlign: TextAlign.center,
                "Deprem İzleri'nde yaralarımızı birlikte saralım, deneyimlerimizi paylaşarak destek ve dayanışma ağı oluşturalım.",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 260,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xffFF6F77)),
                margin: EdgeInsets.only(top: 44),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/loginPage");
                  },
                  child: Text(
                    "Başlayın",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.76,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Poppins"),
                  ),
                )),
          ],
        )
      ]),
    );
  }
}
