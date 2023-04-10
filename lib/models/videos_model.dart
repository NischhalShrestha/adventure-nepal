class VideosModel {
  String? id;
  String? title;

  VideosModel({this.title, this.id});

  factory VideosModel.fromMap(Map<String, dynamic> data) {
    return VideosModel(
      id: data['VideoID'],
      title: data["VideoTitle"],
    );
  }
}
