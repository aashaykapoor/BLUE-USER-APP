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
