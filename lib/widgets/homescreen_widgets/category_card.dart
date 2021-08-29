import 'package:blue/model/image_model.dart';
import 'package:blue/widgets/homescreen_widgets/story_widget.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final ImageModel image;
  CategoryCard({this.title, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          StoryWidget(image),
          Text(
            title,
            style:
                TextStyle(fontWeight: FontWeight.w600, color: Colors.black87),
          )
        ],
      ),
    );
  }
}
