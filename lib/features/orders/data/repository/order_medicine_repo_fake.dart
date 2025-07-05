import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:patient_app/core/database/api/api_consumer.dart';
import 'package:patient_app/core/database/api/api_error_handler.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/core/database/api/end_points.dart';
import 'package:patient_app/features/orders/data/models/make_order_request_model.dart';
import 'package:patient_app/features/orders/data/models/medicine_model.dart';
import 'package:patient_app/features/orders/data/repository/order_medicine_repo.dart';

class OrderMedicineRepoFake implements OrderMedicineRepo {
  final ApiConsumer _apiConsumer;

  OrderMedicineRepoFake(this._apiConsumer);
  @override
  Future<Either<ApiErrorModel, List<MedicineModel>>> searchMedicine(
      String query) async {
    try {
      // Simulate a delay for the search operation
      await Future.delayed(const Duration(seconds: 1));

      final response = {
        "statusCode": 200,
        "message": "Orders retrieved successfully",
        "data": [
          {
            "pharmacyName": "El Tarshopy",
            "branchName": "some name",
            "branchLocation": "Egypt,Tanta,Elestad",
            "stock": 0,
            "price": 10,
            "productName": "Panadol",
            "branchId": "647522ca-78a0-4cc4-b04c-c55705feeb94",
            "systemProductCode": "3fa85f64-5717-4562-b3fc-2c963f66afae",
            "productImage":
                "https://dkud4u09qff41.cloudfront.net/Products/ac84b8ac-e0e8-45e8-827f-7c7a3b0c5aca.jpeg"
          },
          {
            "pharmacyName": "El Tarshopy",
            "branchName": "Dina Group",
            "branchLocation": "Egypt,Tanta,Elestad",
            "stock": 13,
            "price": 70,
            "productName": "Panadol",
            "branchId": "05c4036c-744b-43f7-a070-e0f581fb23e8",
            "systemProductCode": "3fa85f64-5717-4562-b3fc-2c963f66afa7",
            "productImage":
                "https://dkud4u09qff41.cloudfront.net/Products/ac84b8ac-e0e8-45e8-827f-7c7a3b0c5aca.jpeg"
          },
          {
            "pharmacyName": "El Tarshopy",
            "branchName": "Dina Group",
            "branchLocation": "Egypt,Tanta,Elestad",
            "stock": 2,
            "price": 50,
            "productName": "panadol",
            "branchId": "05c4036c-744b-43f7-a070-e0f581fb23e8",
            "systemProductCode": "3fa85f64-5717-4562-b3fc-2c963f66afac",
            "productImage":
                "https://dkud4u09qff41.cloudfront.net/Products/ac84b8ac-e0e8-45e8-827f-7c7a3b0c5aca.jpeg"
          },
          {
            "pharmacyName": "El Tarshopy",
            "branchName": "Gemy Group",
            "branchLocation": "Egypt,Tanta,Elestad",
            "stock": 4,
            "price": 63,
            "productName": "Panadol",
            "branchId": "4462ad6d-35bc-4e69-8146-e45485cbd777",
            "systemProductCode": "3fa85f64-5717-4562-b3fc-2c963f66afa7",
            "productImage":
                "https://dkud4u09qff41.cloudfront.net/Products/ac84b8ac-e0e8-45e8-827f-7c7a3b0c5aca.jpeg"
          },
          {
            "pharmacyName": "El Tarshopy",
            "branchName": "Gemy Group",
            "branchLocation": "Egypt,Tanta,Elestad",
            "stock": 5,
            "price": 68,
            "productName": "panadol",
            "branchId": "4462ad6d-35bc-4e69-8146-e45485cbd777",
            "systemProductCode": "3fa85f64-5717-4562-b3fc-2c963f66afac",
            "productImage":
                "https://dkud4u09qff41.cloudfront.net/Products/ac84b8ac-e0e8-45e8-827f-7c7a3b0c5aca.jpeg"
          }
        ]
      };

      final medicines = (response['data'] as List)
          .map((item) => MedicineModel.fromJson(item))
          .toList();

      return Right(medicines);
    } catch (e) {
      return Left(ApiErrorModel(message: e.toString()));
    }
  }

  @override
  Future<Either<ApiErrorModel, String>> makeOrder(
      {required MakeOrderRequestModel orderRequest}) async {
    try {
      final Response response = await _apiConsumer.post(
        EndPoints.createOrder,
        data: orderRequest.toJson(),
      );
      if (response.statusCode == 201) {
        return const Right('Order created successfully');
      } else {
        return Left(ApiErrorModel(message: response.data['message']));
      }
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }
}
