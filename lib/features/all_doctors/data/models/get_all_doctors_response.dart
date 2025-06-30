import 'package:patient_app/features/home/data/models/doctor_model.dart';

class GetAllDoctorsResponse {
  final String message;
  final int statusCode;
  final List<DoctorModel> items;

  GetAllDoctorsResponse({
    required this.message,
    required this.statusCode,
    required this.items,
  });
  factory GetAllDoctorsResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;
    return GetAllDoctorsResponse(
      message: json['message'] as String,
      statusCode: json['statusCode'] as int,
      items: (data['items'] as List)
          .map((e) => DoctorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
