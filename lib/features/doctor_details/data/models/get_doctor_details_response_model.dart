import 'package:patient_app/features/home/data/models/doctor_model.dart';

class GetDoctorDetailsResponseModel {
  final int statusCode;
  final String message;
  final DoctorModel doctorModel;

  GetDoctorDetailsResponseModel({
    required this.statusCode,
    required this.message,
    required this.doctorModel,
  });
  factory GetDoctorDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    return GetDoctorDetailsResponseModel(
      statusCode: json['statusCode'],
      message: json['message'],
      doctorModel: DoctorModel.fromJson(json['data']),
    );
  }
}
