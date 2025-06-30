import 'package:patient_app/features/home/data/models/doctor_model.dart';

class GetTopRatedDoctorsResponse {
  final String message;
  final int statusCode;
  final List<DoctorModel> items;

  GetTopRatedDoctorsResponse({
    required this.message,
    required this.statusCode,
    required this.items,
  });

  factory GetTopRatedDoctorsResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;
    return GetTopRatedDoctorsResponse(
      message: json['message'] as String,
      statusCode: json['statusCode'] as int,
      items: (data['items'] as List)
          .map((e) => DoctorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
