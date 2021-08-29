import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key key}) : super(key: key);

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
          Text('Category')
        ],
      ),
    );
  }
}
