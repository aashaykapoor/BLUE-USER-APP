import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  StoryWidget(),
                  StoryWidget(),
                  StoryWidget(),
                  StoryWidget(),
                  StoryWidget(),
                  StoryWidget(),
                  StoryWidget(),
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
                      decoration: BoxDecoration(
                          //  borderRadius: BorderRadius.circular(10),
                          color: i % 2 == 0 ? Colors.orange : Colors.purple),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class StoryWidget extends StatelessWidget {
  const StoryWidget({Key? key}) : super(key: key);

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
          maxRadius: 40,
        ),
      ),
    );
  }
}
