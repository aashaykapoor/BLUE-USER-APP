import 'package:blue/model/homescreen_model.dart';
import 'package:blue/widgets/mini_card_widget.dart';
import 'package:flutter/material.dart';

class CategoryListScreen extends StatelessWidget {
  final Category category;
  CategoryListScreen(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.title,
          style: TextStyle(color: Colors.red),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(category.offers.length,
              (index) => MiniCardWidget(category.offers[index])),
        ),
      ),
    );
  }
}
