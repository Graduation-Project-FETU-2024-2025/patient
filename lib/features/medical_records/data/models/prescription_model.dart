class PrescriptionModel {
  final String doctorId;
  final String appointmentId;
  final String tests; // e.g., "pla pla pla"
  final String? nextAppointment; // e.g., "2025-01-01T00:00:00"
  final String diagnosis; // e.g., "Any thing"
  final String? prescriptionProductDTOs; // e.g., 'this is a test prescription'

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