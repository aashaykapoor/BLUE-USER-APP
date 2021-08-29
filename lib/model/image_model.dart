class ImageModel {
  String main;
  String sub;
  bool isOnline;
  ImageModel.fromMap(Map<String, dynamic> map) {
    this.main = map['main_img'];
    this.sub = map['sub_img'];
    this.isOnline = map['is_online'];
  }
}
