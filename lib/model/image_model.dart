class ImageModel {
  String main;
  String sub;
  bool isOnline;
  int priority;
  String mapLink;
  String phoneNumber;
  ImageModel.fromMap(Map<String, dynamic> map) {
    this.main = map['main_img'];
    this.sub = map['sub_img'];
    this.isOnline = map['is_online'];
    this.priority = map['priority'];
    this.mapLink = map['map_link'];
    this.phoneNumber = map['phone'];
  }
}

class StoryModel {
  bool isOnline;
  String mainImg;
  String subImg;
  String knowMoreImg;
  String phoneNumber;
  String location;

  StoryModel.fromMap(Map<String, dynamic> map) {
    this.isOnline = map['is_online'];
    this.mainImg = map['main_img'];
    this.subImg = map['sub_img'];
    this.knowMoreImg = map['know_more'];
    this.location = map['map_link'];
    this.phoneNumber = map['phone'];
  }
}
