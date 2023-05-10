import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagramm_app_ui/models/post_model.dart';
import 'package:instagramm_app_ui/models/story_model.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);
  static final String id = "feed_page";

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Story> _stories = [
    Story("assets/images/user_1.jpeg", "Jazzmin"),
    Story("assets/images/user_2.jpeg", "Sylvester"),
    Story("assets/images/user_3.jpeg", "Lavina"),
    Story("assets/images/user_1.jpeg", "Jazzmin"),
    Story("assets/images/user_2.jpeg", "Sylvester"),
    Story("assets/images/user_3.jpeg", "Lavina"),
  ];

  List<Post> _posts = [
    Post("assets/images/user_1.jpeg","Brianne",  "assets/images/feed_1.jpeg", "Consequatur nihil aliquid amnis consequatur"),
    Post("assets/images/user_2.jpeg","Henri",  "assets/images/feed_2.jpeg", "Consequatur nihil aliquid amnis consequatur"),
    Post("assets/images/user_3.jpeg","Brianne",  "assets/images/feed_3.jpeg", "Consequatur nihil aliquid amnis consequatur"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Divider(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Stories", style: TextStyle(color: Colors.white60, fontSize: 14),),
                    Text('Watch all', style: TextStyle(color: Colors.white60, fontSize: 14),)
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: _stories.map((story){
                    return _makeStory(story);
                  }).toList(),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _posts.length,
                  itemBuilder: (ctx, i){
                    return _itemPost(_posts[i]);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget _makeStory(Story story){
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(width: 3, color: Colors.purple)
          ),
          child: Container(
            padding: EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.image),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 5,),
        Text(story.name, style: TextStyle(color: Colors.white60),)
      ],
    );
  }

  Widget _itemPost(Post post){
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: AssetImage(post.userImage),
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text(post.username, style: TextStyle(color: Colors.white60),)
                  ],
                ),
                Icon(Icons.more_horiz, size: 30, color: Colors.white60,)
              ],
            ),
          ),
          FadeInImage(placeholder: AssetImage("assets/images/placeholder.png"), image: AssetImage(post.postImage),
          width: MediaQuery.of(context).size.width,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Feather.heart, color: Colors.white60,),
                    SizedBox(width: 10,),
                    Icon(Feather.message_circle, color: Colors.white60,),
                    SizedBox(width: 10,),
                    Icon(Feather.send, color: Colors.white60,),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Icon(FontAwesome.bookmark_o, color: Colors.white60,),
              )
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 14),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children:[
                  TextSpan(
                    text: "Liked by ",
                    style: TextStyle(color: Colors.white60)
                  ),
                  TextSpan(
                    text: "Sigmund, ",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                      text: "Yessinia, ",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                      text: "Dayana, ",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                    text: "and ",
                    style: TextStyle(color: Colors.white60)
                  ),
                  TextSpan(
                      text: "1263 others ",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                  )
                ]
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 14),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: post.username+" ",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                    text: post.caption,
                    style: TextStyle(color: Colors.white60)
                  )
                ]
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 14),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                text: "February 2020",
                style: TextStyle(color: Colors.white60)
              ),
            ),
          )
        ],
      ),
    );
  }
}
