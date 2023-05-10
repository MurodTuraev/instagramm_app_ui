import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagramm_app_ui/pages/feed_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String id = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  var _pages = [
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Instagram", style: TextStyle(color: Colors.white60),),
        leading: IconButton(onPressed:(){},icon:Icon(Feather.camera, color: Colors.white60,)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Feather.tv, color: Colors.white60,)),
          IconButton(onPressed: (){}, icon: Icon(Feather.send, color: Colors.white60,)),
        ],
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        brightness: Brightness.dark,
      ),
      body: _pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (i){
          setState(() {
            currentPage = i;
          });
        },
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Foundation.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.search),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.plus_square),
            label: "Upload"
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.heart),
            label: "Like"
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.user),
            label: "Account"
          ),

        ],
      ),
    );
  }
}
