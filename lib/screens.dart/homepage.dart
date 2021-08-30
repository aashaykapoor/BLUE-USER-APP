import 'package:blue/model/homescreen_model.dart';
import 'package:blue/screens.dart/detailed_view.dart';
import 'package:blue/services/firebase_db.dart';
import 'package:blue/services/vouchers.dart';
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (c) => VouchersScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 20, right: 20),
              child: Icon(
                Icons.ac_unit_outlined,
              ),
            ),
          )
        ],
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Image.asset(
            'assets/images/home_logo.png',
            width: 230,
          ),
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
                            initialPage: 0,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            viewportFraction: 1.0),
                        items: snapshot.data.sliderOffers.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return GestureDetector(
                                onTap: () {
                                  if (i.sub != null && i.sub.isNotEmpty) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailedView(i)));
                                  }
                                },
                                child: Container(
                                  height: 200,
                                  width: MediaQuery.of(context).size.width,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                        fit: BoxFit.fitWidth, imageUrl: i.main),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10),
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
                          snapshot.data.miniCards.length > 4
                              ? 4
                              : snapshot.data.miniCards.length,
                          (index) =>
                              MiniCardWidget(snapshot.data.miniCards[index]),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 100,
                        width: size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: snapshot.data.sliderOffers[0].main),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        // crossAxisSpacing: 20,
                        // mainAxisSpacing: 20,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        children: List.generate(
                            snapshot.data.categories.length,
                            (index) =>
                                CategoryCard(snapshot.data.categories[index])),
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
