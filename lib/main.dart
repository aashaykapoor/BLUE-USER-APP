import 'package:blue/model/image_model.dart';
import 'package:blue/screens.dart/homepage.dart';
import 'package:blue/screens.dart/detailed_view.dart';
import 'package:blue/services/firebase_db.dart';
import 'package:blue/widgets/homescreen_widgets/story_dialog.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blue App',
      home: HomePage(),
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              elevation: 0,
              color: Colors.white,
              iconTheme: IconThemeData(color: Colors.blueGrey))),
    );
  }
}
