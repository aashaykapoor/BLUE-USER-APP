import 'dart:async';

import 'package:blue/model/image_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'detailed_view.dart';

class StoryPage extends StatefulWidget {
  List<StoryModel> stories;
  int selectedIndex;
  StoryPage(this.selectedIndex, this.stories);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  Timer _timerr;
  Timer storyTimer;
  @override
  void dispose() {
    _timerr.cancel();
    storyTimer.cancel();

    super.dispose();
  }

  @override
  void initState() {
    _currentIndex.value = widget.selectedIndex;
    startStoryTimer();
    _timerr = Timer.periodic(Duration(seconds: 15), (timer) {
      print('aashay is working');
      if (_currentIndex.value < widget.stories.length - 1) {
        _currentIndex.value++;
      } else {
        Navigator.pop(context);
      }
      ;
    }); // TODO: implement initState
    super.initState();
  }

  @override
  ValueNotifier<double> progressNotifier;
  ValueNotifier<int> _currentIndex = ValueNotifier(0);

  Widget build(BuildContext context) {
    progressNotifier = ValueNotifier<double>(0.1);

    PageController _pageController;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Expanded(
          child: GestureDetector(
            onVerticalDragStart: (s) {
              
              Navigator.pop(context);
            },
            onTapDown: (details) => _onTapDown(details),
            child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (page) {
                  _currentIndex.value = page;
                },
                itemCount: widget.stories.length,
                itemBuilder: (context, i) => Stack(
                      children: [
                        ValueListenableBuilder<int>(
                          valueListenable: _currentIndex,
                          builder: (context, value, index) => Container(
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: CachedNetworkImage(
                                  imageUrl: widget
                                      .stories[value ?? widget.selectedIndex]
                                      .subImg),
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 50, left: 20),
                        //   child: CircleAvatar(
                        //     radius: 35,
                        //     backgroundImage: CachedNetworkImageProvider(
                        //         widget.stories[_currentIndex.value].mainImg),
                        //   ),
                        // ),
                        ValueListenableBuilder<double>(
                            valueListenable: progressNotifier,
                            builder: (context, value, child) =>
                                LinearProgressIndicator(
                                  color: Colors.blue,
                                  backgroundColor: Colors.transparent,
                                  value: value.toDouble(),
                                )),
                        widget.stories[_currentIndex.value].knowMoreImg !=
                                    null &&
                                widget.stories[_currentIndex.value].knowMoreImg
                                    .isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.all(30),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailedView(
                                                    widget
                                                        .stories[
                                                            _currentIndex.value]
                                                        .knowMoreImg,
                                                    locationLink: widget
                                                        .stories[
                                                            _currentIndex.value]
                                                        .location,
                                                    phoneNumber: widget
                                                        .stories[
                                                            _currentIndex.value]
                                                        .phoneNumber,
                                                  )));
                                    },
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 10),
                                        child: Text(
                                          'Know More',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container()
                      ],
                    )),
          ),
        ),
      ),
    );
  }

  void startStoryTimer() {
    storyTimer = Timer.periodic(Duration(milliseconds: 1), (timer) {
      if (progressNotifier.value < 1) {
        progressNotifier.value += (progressNotifier.value / 15) / 100;
      }
    });
  }

  void stopStoryTimer() {
    if (storyTimer.isActive) {
      progressNotifier.value = 0.001;
      storyTimer.cancel();
      storyTimer = null;
    }
  }

  onTimerHits() {}

  void _onTapDown(TapDownDetails details) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;
    if (dx < screenWidth / 3) {
      if (_currentIndex.value - 1 >= 0) {
        _currentIndex.value -= 1;
      }
    } else if (dx > 2 * screenWidth / 3) {
      if (_currentIndex.value + 1 < widget.stories.length) {
        _currentIndex.value += 1;
      } else {
        // Out of bounds - loop story
        Navigator.of(context).pop();
        // _currentIndex = 0;
      }
    }
  }
}
