import 'package:blue/model/image_model.dart';
import 'package:flutter/material.dart';

class DetailedView extends StatelessWidget {
  final ImageModel imageModel;
  DetailedView(this.imageModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Center(
              child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                imageModel.sub,
                fit: BoxFit.fitWidth,
              ),
            ),
          ))
        ],
      ),
    );
  }
}
