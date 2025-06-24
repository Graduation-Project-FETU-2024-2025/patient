import 'package:dartz/dartz.dart';
import 'package:patient_app/core/database/api/api_consumer.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/features/medical_records/data/models/medical_records_model.dart';
import 'package:patient_app/features/medical_records/data/repository/medical_records_repo.dart';

class MedicalRecordsRepoImpl implements MedicalRecordsRepo {
  final ApiConsumer _apiConsumer;

  MedicalRecordsRepoImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;
  @override
  Future<Either<ApiErrorModel, MedicalRecordsModel>> getMedicalRecords() async {
    try {
      // Simulating a network call to fetch medical records
      await Future.delayed(const Duration(seconds: 2));
      final Map<String, dynamic> response = {
        "success": true,
        "statusCode": 200,
        "message": "User history retrieved successfully",
        "data": {
          "image":
              "https://res.cloudinary.com/dg67rzst0/image/upload/v1747127070/d67f9536-adf8-4946-8725-852dd2155d08.png",
          "name": "Hamza Mosaad Mohamed",
          "email": "hamzamosd@gmail.com",
          "phoneNumber": "0124578963",
          "age": 23,
          "gender": "Male",
          "appointment": {
            "id": "d67f9536-adf8-4946-8725-852dd2155d07",
            "date": "2025-01-01T00:00:00",
            "status": null,
            "clinicId": "00000000-0000-0000-0000-000000000000",
            "clinicName": "string",
            "userId": "d67f9536-adf8-4946-8725-852dd2155d08",
            "userName": null,
            "doctorName": "hamza",
            "price": 0,
            "userImage": null,
            "type": "NewVisit",
            "complaint": "jhaskhldkshfjk",
            "prescription": {
              "doctorId": "00000000-0000-0000-0000-000000000000",
              "appointmentId": "00000000-0000-0000-0000-000000000000",
              "tests": "pla pla pla",
              "nextAppointment": null,
              "diagnosis": "Any thing",
              "prescriptionProductDTOs": 'this is a test prescription',
            }
          }
        }
      };
      return Right(MedicalRecordsModel.fromJson(
          response['data'])); // Simulating an error
    } catch (e) {
      return Left(ApiErrorModel(
        message: 'Failed to fetch medical records',
        statusCode: 500,
      ));
      // return Left(ApiErrorHandler.handleError(e));
    }
  }
}
