import 'package:blue/model/image_model.dart';

class HomeScreenModel {
  List<StoryModel> stories;
  List<ImageModel> sliderOffers;
  List<ImageModel> miniCards;

  HomeScreenModel.fromMap(Map<String, dynamic> map) {
    this.stories = ((map['stories'] ?? []) as List).map((response) {
      return StoryModel.fromMap(response);
    }).toList();
    this.sliderOffers = ((map['main_slider'] ?? []) as List).map((response) {
      return ImageModel.fromMap(response);
    }).toList();
    this.miniCards = ((map['mini_cards'] ?? []) as List).map((response) {
      return ImageModel.fromMap(response);
    }).toList();
  }
}
