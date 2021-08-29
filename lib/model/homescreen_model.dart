import 'package:blue/model/image_model.dart';

class HomeScreenModel {
  List<ImageModel> stories;
  List<ImageModel> sliderOffers;

  HomeScreenModel.fromMap(Map<String, dynamic> map) {
    this.stories = ((map['stories'] ?? []) as List).map((response) {
      return ImageModel.fromMap(response);
    }).toList();
    this.sliderOffers = ((map['main_slider'] ?? []) as List).map((response) {
      return ImageModel.fromMap(response);
    }).toList();
  }
}
