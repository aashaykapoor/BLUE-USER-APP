import 'package:blue/model/image_model.dart';
import 'package:blue/screens/story_page.dart';
import 'package:blue/widgets/homescreen_widgets/story_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class StoryWidget extends StatelessWidget {
  final StoryModel storyImage;
  final Function onNextPressed;
  final Function onPrevPressed;
  final List<StoryModel> stories;
  final int selectedIndex;

  StoryWidget(this.storyImage,
      {this.onNextPressed,
      this.onPrevPressed,
      this.stories,
      this.selectedIndex});

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
                    content: Container(
                        width: MediaQuery.of(context).size.width,
                        child: StoryPage(selectedIndex, stories)),
                  ));
        },
        child: Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              width: 2,
              color: Color(0xFF2874F0),
            ),
          ),
          child: CircleAvatar(
            foregroundImage: CachedNetworkImageProvider(
              storyImage.mainImg,
            ),
            maxRadius: 45,
          ),
        ),
      ),
    );
  }
}
