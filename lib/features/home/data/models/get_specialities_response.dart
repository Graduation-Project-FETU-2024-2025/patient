import 'package:patient_app/features/all_Specialities/data/models/specialities_model.dart';

class GetSpecialitiesResponse {
  final String message;
  final int statusCode;
  final List<SpecialitiesModel> data;

  GetSpecialitiesResponse({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory GetSpecialitiesResponse.fromJson(Map<String, dynamic> json) {
    return GetSpecialitiesResponse(
      message: json['message'] as String,
      statusCode: json['statusCode'] as int,
      data: (json['data'] as List<dynamic>)
          .map((item) =>
              SpecialitiesModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
