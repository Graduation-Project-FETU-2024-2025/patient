import 'package:patient_app/features/all_Specialities/data/models/specialities_model.dart';

class DoctorModel {
  final String id;
  final String fullName;
  final String? clinicName;
  final String? clinicAddress;
  final double rating;
  final int reviewsCount;
  final String? image;
  final String? phoneNumber;
  final String? nextAvailableAppointment;
  final double price;
  final String? about;
  final SpecialitiesModel specialization;

  DoctorModel({
    required this.id,
    required this.fullName,
    this.clinicName,
    this.clinicAddress,
    required this.rating,
    required this.reviewsCount,
    required this.price,
    required this.specialization,
    this.about,
    this.image,
    this.phoneNumber,
    this.nextAvailableAppointment,
  });
  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
        id: json['id'] ?? '',
        fullName: json['fullName'] ?? '',
        clinicName: json['clinicName'],
        clinicAddress: json['clinicAddress'],
        rating: (json['rating'] ?? 0).toDouble(),
        reviewsCount: json['reviewsCount'] ?? 0,
        image: json['image'],
        phoneNumber: json['phoneNumber'],
        nextAvailableAppointment: json['nextAvailableAppointment'],
        price: (json['price'] ?? 0).toDouble(),
        about: json['about'],
        specialization: SpecialitiesModel.fromJson(json['specialization']));
  }
}
