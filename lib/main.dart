import 'package:depremizleri/home.dart';
import 'package:depremizleri/landing.dart';
import 'package:depremizleri/loginPage.dart';
import 'package:depremizleri/myTextPage.dart';
import 'package:depremizleri/newPostPage.dart';
import 'package:depremizleri/postPage.dart';
import 'package:depremizleri/profile.dart';
import 'package:flutter/material.dart';

import 'models/User.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<User> users = [
    User("1", "Ezgi", "Güney", "Örnek Başlık", "Örnek İçerik", ["comments"], 0,
        false)
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => landing(),
        "/loginPage": (context) => loginPage(),
        "/home": (context) => Home(),
        "/profile": (context) => ProfilePage(users: users),
        "/text": (context) => myTextPage(
              users: [],
            ),
        "/newPost": (context) => newPostPage(
              addPost: addPost,
            )
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/post') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => PostPage(post: args['post']),
          );
        }
        return null;
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
    );
  }

  void addPost(User user) {
    setState(() {
      users.add(user);
    });
  }

  void addProfile(User user) {
    setState(() {
      users.add(user);
    });
  }
}
