import 'package:blue/model/homescreen_model.dart';

import 'package:blue/screens/category_list.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  Category category;
  CategoryCard(this.category);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (category.offers != null && category.offers.isNotEmpty) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CategoryListScreen(category)));
        }
      },
      child: Container(
        child: Column(
          children: [
            CircleAvatar(
              maxRadius: 40,
              foregroundImage: CachedNetworkImageProvider(category.mainImage),
            ),
            SizedBox(
              height: 10,
            ),
            Text(category.title)
          ],
        ),
      ),
    );
  }
}
