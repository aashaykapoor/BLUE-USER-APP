import 'package:blue/model/homescreen_model.dart';
import 'package:blue/model/image_model.dart';
import 'package:blue/screens.dart/detailed_view.dart';
import 'package:blue/services/firebase_db.dart';
import 'package:blue/widgets/homescreen_widgets/category_card.dart';
import 'package:blue/widgets/homescreen_widgets/story_widget.dart';
import 'package:blue/widgets/mini_card_widget.dart';
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
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              snapshot.data.stories.length,
                              (index) =>
                                  StoryWidget(snapshot.data.stories[index])),
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
                        items: snapshot.data.sliderOffers.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailedView(i)));
                                },
                                child: Container(
                                  height: 200,
                                  child: CachedNetworkImage(
                                      fit: BoxFit.cover, imageUrl: i.main),
                                  decoration: BoxDecoration(
                                      //  borderRadius: BorderRadius.circular(10),
                                      ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        children: List.generate(
                          snapshot.data.miniCards.length,
                          (index) =>
                              MiniCardWidget(snapshot.data.miniCards[index]),
                        ),
                      ),
                      CategoryCard(
                        title: 'Kids',
                        image: snapshot.data.stories[0],
                      ),
                      Container(
                        height: 500,
                        child: GridView.builder(
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 10.0),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 4.0,
                            childAspectRatio: 3 / 3.2,
                            mainAxisSpacing: 8.0,
                          ),
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int index) {
                            return CategoryCard(
                              image: snapshot.data.stories[1],
                              title: 'Men',
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
