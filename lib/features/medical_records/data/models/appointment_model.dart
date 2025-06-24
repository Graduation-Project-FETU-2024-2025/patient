import 'package:patient_app/features/medical_records/data/models/prescription_model.dart';

class AppointmentModel {
  final String id;
  final String date;
  final String? status;
  final String clinicId;
  final String clinicName;
  final String userId;
  final String? userName;
  final String doctorName;
  final double price;
  final String? userImage;
  final String type; // e.g., "NewVisit", "FollowUp"
  final String complaint; // e.g., "jhaskhldkshfjk"
  final PrescriptionModel prescription;

  AppointmentModel({
    required this.id,
    required this.date,
    this.status,
    required this.clinicId,
    required this.clinicName,
    required this.userId,
    this.userName,
    required this.doctorName,
    required this.price,
    this.userImage,
    required this.type,
    required this.complaint,
    required this.prescription,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['id'] ?? '',
      date: json['date'] ?? '',
      status: json['status'],
      clinicId: json['clinicId'] ?? '',
      clinicName: json['clinicName'] ?? '',
      userId: json['userId'] ?? '',
      userName: json['userName'],
      doctorName: json['doctorName'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      userImage: json['userImage'],
      type: json['type'] ?? '',
      complaint: json['complaint'] ?? '',
      prescription: PrescriptionModel.fromJson(json['prescription']),
    );
  }
}




