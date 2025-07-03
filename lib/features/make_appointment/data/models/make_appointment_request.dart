import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

class MakeAppointmentRequest {
  final String date;
  final String clinicId;
  final String userId;
  final String doctorName;
  final String complaint;
  final String type;
  final PlatformFile? file;

  MakeAppointmentRequest({
    required this.date,
    required this.clinicId,
    required this.userId,
    required this.doctorName,
    required this.type,
    required this.complaint,
    required this.file,
  });

  Future<FormData> toFormData() async {
    return FormData.fromMap({
      "date": date,
      "clinicId": clinicId,
      "userId": userId,
      "doctorName": doctorName,
      "type": type,
      "complaint": complaint,
      "file": file == null
          ? null
          : await MultipartFile.fromFile(file!.path!, filename: file!.name),
    });
  }
}
