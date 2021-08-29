class ImageModel {
  String main;
  String sub;
  bool isOnline;
  int priority;
  ImageModel.fromMap(Map<String, dynamic> map) {
    this.main = map['main_img'];
    this.sub = map['sub_img'];
    this.isOnline = map['is_online'];
    this.priority = map['priority'];
  }
}

class StoryModel {
  bool isOnline;
  String mainImg;
  String subImg;
  String knowMoreImg;

  StoryModel.fromMap(Map<String, dynamic> map) {
    this.isOnline = map['is_online'];
    this.mainImg = map['main_img'];
    this.subImg = map['sub_img'];
    this.knowMoreImg = map['know_more_img'];
  }
}
