class PrescriptionModel {
  final String doctorId;
  final String appointmentId;
  final String tests;
  final String? nextAppointment;
  final String diagnosis;
  final String? prescriptionProductDTOs; 

  PrescriptionModel({
    required this.doctorId,
    required this.appointmentId,
    required this.tests,
    this.nextAppointment,
    required this.diagnosis,
    this.prescriptionProductDTOs,
  });

  factory PrescriptionModel.fromJson(Map<String, dynamic> json) {
    return PrescriptionModel(
      doctorId: json['doctorId'] ?? '',
      appointmentId: json['appointmentId'] ?? '',
      tests: json['tests'] ?? '',
      nextAppointment: json['nextAppointment'],
      diagnosis: json['diagnosis'] ?? '',
      prescriptionProductDTOs: json['prescriptionProductDTOs'],
    );
  }
}