import 'package:blue/model/homescreen_model.dart';
import 'package:blue/providers/storyProvider.dart';

import 'package:blue/services/firebase_db.dart';
import 'package:blue/services/vouchers.dart';
import 'package:blue/widgets/homescreen_widgets/category_card.dart';
import 'package:blue/widgets/homescreen_widgets/story_widget.dart';
import 'package:blue/widgets/mini_card_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import 'detailed_view.dart';

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
              padding: const EdgeInsets.only(top: 20, right: 8, bottom: 5),
              child: Image.asset(
                'assets/images/rainbow.png',
                height: 70,
                width: 70,
              ),
            ),
          )
        ],
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          child: Image.asset(
            'assets/images/home_logo.png',
            width: 150,
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
              List randomStories = snapshot.data.stories;
              randomStories.shuffle();
              // Provider.of<StoryProvider>(context, listen: false).stories =
              //     randomStories;
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
                                randomStories.length,
                                (index) => StoryWidget(
                                      randomStories[index],
                                      onNextPressed: () {},
                                      onPrevPressed: () {},
                                      stories: randomStories,
                                      selectedIndex: snapshot.data.stories
                                          .indexOf(randomStories[index]),
                                    ))),
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
                                            builder: (context) => DetailedView(
                                                  i.sub,
                                                  phoneNumber: i.phoneNumber,
                                                  locationLink: i.mapLink,
                                                )));
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
                      snapshot.data.horizontalCards.isEmpty
                          ? Container()
                          : GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) => DetailedView(
                                        snapshot.data.horizontalCards[0].sub)));
                              },
                              child: Container(
                                height: 100,
                                width: size.width,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl: snapshot
                                          .data.horizontalCards[0].main),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey),
                              )),
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
                          snapshot.data.cardss.length,
                          (index) =>
                              MiniCardWidget(snapshot.data.cardss[index]),
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
