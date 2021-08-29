import 'dart:convert';

import 'package:blue/model/homescreen_model.dart';
import 'package:blue/model/image_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDataBase {
  static FirebaseFirestore db = FirebaseFirestore.instance;
  static CollectionReference blueDb = db.collection('blueDB');

  static Future<HomeScreenModel> getHomeScreenData() async {
    var homeScreen = await blueDb.doc('homescreen').get();
    Map<String, dynamic> homeMap = homeScreen.data();
    return HomeScreenModel.fromMap(homeMap);
  }
}
