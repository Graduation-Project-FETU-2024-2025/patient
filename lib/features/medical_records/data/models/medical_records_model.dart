import 'package:patient_app/features/medical_records/data/models/appointment_model.dart';

class MedicalRecordsModel {
  final String image;
  final String name;
  final String email;
  final String phoneNumber;
  final int age;
  final String gender;
  final AppointmentModel appointmentModel;
  MedicalRecordsModel(
      {required this.image,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.age,
      required this.gender,
      required this.appointmentModel});

  factory MedicalRecordsModel.fromJson(Map<String, dynamic> json) {
    return MedicalRecordsModel(
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      age: json['age'] ?? 0,
      gender: json['gender'] ?? '',
      appointmentModel: AppointmentModel.fromJson(json['appointment']),
    );
  }
}


