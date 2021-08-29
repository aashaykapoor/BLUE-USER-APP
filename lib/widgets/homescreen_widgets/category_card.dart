import 'package:blue/model/homescreen_model.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  Category category;
  CategoryCard(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CircleAvatar(
            maxRadius: 40,
          ),
          SizedBox(
            height: 10,
          ),
          Text(category.title)
        ],
      ),
    );
  }
}
