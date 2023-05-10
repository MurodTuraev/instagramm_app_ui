import 'package:flutter/material.dart';
import 'package:instagramm_app_ui/pages/feed_page.dart';
import 'package:instagramm_app_ui/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        HomePage.id: (context) => HomePage(),
        FeedPage.id: (context) => FeedPage(),
      },
    );
  }
}

