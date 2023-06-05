import 'package:depremizleri/home.dart';
import 'package:depremizleri/landing.dart';
import 'package:depremizleri/myTextPage.dart';
import 'package:depremizleri/newPostPage.dart';
import 'package:depremizleri/postPage.dart';
import 'package:depremizleri/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => landing(),
        "/home": (context) => Home(),
        "/post": (context) => PostPage(),
        "/profile": (context) => ProfilePage(),
        "/text": (context) => myTextPage(),
        "/newPost": (context) => newPostPage()
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
    );
  }
}
