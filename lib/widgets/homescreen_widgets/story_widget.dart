import 'package:blue/model/image_model.dart';
import 'package:blue/widgets/homescreen_widgets/story_dialog.dart';
import 'package:flutter/material.dart';

class StoryWidget extends StatelessWidget {
  final StoryModel storyImage;
  StoryWidget(this.storyImage);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    insetPadding: EdgeInsets.zero,
                    contentPadding: EdgeInsets.zero,
                    content: StoryDialog(storyImage),
                  ));
        },
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
            foregroundImage: NetworkImage(
              storyImage.mainImg,
            ),
            maxRadius: 35,
          ),
        ),
      ),
    );
  }
}
