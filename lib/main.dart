import 'package:depremizleri/home.dart';
import 'package:depremizleri/landing.dart';
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
  List<User> users = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => Home(),
        "/home": (context) => Home(),
        "/profile": (context) => ProfilePage(),
        "/text": (context) => myTextPage(),
        "/newPost": (context) => newPostPage(addPost: addPost)
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/post') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => PostPage(post: args['post']),
          );
        }
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
}
