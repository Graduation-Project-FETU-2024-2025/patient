class SpecialitiesModel {
  final String arName;
  final String enName;
  final String id;
  final String icon;

  SpecialitiesModel({
    required this.arName,
    required this.enName,
    required this.id,
    required this.icon,
  });
  factory SpecialitiesModel.fromJson(Map<String, dynamic> json) {
    return SpecialitiesModel(
      arName: json['arName'] as String,
      enName: json['enName'] as String,
      id: json['id'] as String,
      icon: json['icon'] as String,
    );
  }
}
