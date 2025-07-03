class AppointmentModel {
  final String id;
  final DateTime date;
  final String status;
  final String clinicId;
  final String clinicName;
  final String userId;
  final String userName;
  final String doctorName;
  final double price;
  final String userImage;
  final String? fileUrl;
  final String type;
  final String complaint;
  final String? prescription;

  AppointmentModel({
    required this.id,
    required this.date,
    required this.status,
    required this.clinicId,
    required this.clinicName,
    required this.userId,
    required this.userName,
    required this.doctorName,
    required this.price,
    required this.userImage,
    this.fileUrl,
    required this.type,
    required this.complaint,
    this.prescription,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['id'],
      date: DateTime.parse(json['date']),
      status: json['status'],
      clinicId: json['clinicId'],
      clinicName: json['clinicName'],
      userId: json['userId'],
      userName: json['userName'],
      doctorName: json['doctorName'],
      price: (json['price'] as num).toDouble(),
      userImage: json['userImage'],
      fileUrl: json['fileUrl'],
      type: json['type'],
      complaint: json['complaint'],
      prescription: json['prescription'],
    );
  }
}
