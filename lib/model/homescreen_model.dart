import 'package:blue/model/image_model.dart';

class HomeScreenModel {
  List<StoryModel> stories;
  List<ImageModel> sliderOffers;
  List<ImageModel> miniCards;
  List<Category> categories;
  List<ImageModel> horizontalCards;

  HomeScreenModel.fromMap(Map<String, dynamic> map) {
    this.stories = [];
    this.categories = [];
    horizontalCards = [];

    for (var s in map['stories']) {
      if (s['is_online']) {
        this.stories.add(StoryModel.fromMap(s));
      }
    }
    for (var s in map['horizontal_card']) {
      if (s['is_online']) {
        this.horizontalCards.add(ImageModel.fromMap(s));
      }
    }
    for (var s in map['categories']) {
      if (s['is_online']) {
        this.categories.add(Category.fromMap(s));
      }
    }
    this.sliderOffers = ((map['main_slider'] ?? []) as List).map((response) {
      return ImageModel.fromMap(response);
    }).toList();
    this.miniCards = ((map['mini_cards'] ?? []) as List).map((response) {
      return ImageModel.fromMap(response);
    }).toList();
  }
}

class Category {
  String title;
  bool isOnline;
  String mainImage;
  List<ImageModel> offers;

  Category.fromMap(Map<String, dynamic> map) {
    this.title = map['name'];
    this.isOnline = map['is_online'];
    this.mainImage = map['main_img'];
  }
}
