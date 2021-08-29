import 'package:blue/model/homescreen_model.dart';
import 'package:blue/services/firebase_db.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.ac_unit_outlined,
              color: Colors.red,
            ),
          )
        ],
        backgroundColor: Colors.white,
        title: Text(
          'BLUE',
          style: TextStyle(color: Colors.pink),
        ),
      ),
      body: FutureBuilder(
          future: FirebaseDataBase.getHomeScreenData(),
          builder: (context, AsyncSnapshot<HomeScreenModel> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          StoryWidget(snapshot.data.stories[0]),
                          StoryWidget(snapshot.data.stories[1]),
                          StoryWidget(snapshot.data.stories[0]),
                          StoryWidget(snapshot.data.stories[1]),
                          StoryWidget(snapshot.data.stories[0]),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                          height: 200.0,
                          pageSnapping: true,
                          autoPlay: true,
                          enlargeCenterPage: true),
                      items: [1, 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              height: 200,
                              child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: snapshot.data.sliderOffers[0].main),
                              decoration: BoxDecoration(
                                  //  borderRadius: BorderRadius.circular(10),
                                  ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 150,
                      width: 160,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: snapshot.data.stories[1].main),
                      ),
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            spreadRadius: 0.2,
                            blurRadius: 10,
                            color: Colors.black45,
                            offset: Offset(0, 1))
                      ], borderRadius: BorderRadius.circular(10)),
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
}
