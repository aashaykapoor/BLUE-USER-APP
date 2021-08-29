import 'package:blue/model/image_model.dart';
import 'package:blue/screens.dart/detailed_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MiniCardWidget extends StatelessWidget {
  final ImageModel image;
  MiniCardWidget(this.image);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (image.sub != null && image.sub.isNotEmpty) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => DetailedView(image)));
        }
      },
      child: Container(
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(fit: BoxFit.cover, imageUrl: image.main),
        ),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              spreadRadius: 0.2,
              blurRadius: 5,
              color: Colors.black45,
              offset: Offset(0, 1))
        ], borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
