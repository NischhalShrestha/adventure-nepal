class AdventureModel {
  String? name;
  String? description;
  String? backgroundImage;
  String? iconImage;
  String id;

  AdventureModel(
      {this.name,
      this.description,
      this.backgroundImage,
      this.iconImage,
      required this.id});

  factory AdventureModel.fromMap(Map<String, dynamic> data, String id) {
    return AdventureModel(
      name: data["Name"],
      description: data["Description"],
      backgroundImage: data["background_image"],
      iconImage: data["Icon"],
      id: id,
    );
  }
}
