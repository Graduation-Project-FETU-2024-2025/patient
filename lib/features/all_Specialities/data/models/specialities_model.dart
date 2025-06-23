class SpecialitiesModel {
  final String name;
  final String image;

  SpecialitiesModel({
    required this.name,
    required this.image,
  });
  factory SpecialitiesModel.fromJson(Map<String, dynamic> json) {
    return SpecialitiesModel(
      name: json['name'] as String,
      image: json['image'] as String,
    );
  }
}
