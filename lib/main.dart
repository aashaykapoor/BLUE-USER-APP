import 'package:blue/model/image_model.dart';
import 'package:blue/screens.dart/homepage.dart';
import 'package:blue/services/firebase_db.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: HomePage());
  }
}

class StoryWidget extends StatelessWidget {
  final ImageModel storyImage;
  StoryWidget(this.storyImage);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            width: 2,
            color: Colors.purple,
          ),
        ),
        child: CircleAvatar(
          backgroundColor: Colors.red,
          foregroundImage: NetworkImage(storyImage.main),
          maxRadius: 40,
        ),
      ),
    );
  }
}
