import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/features/orders_log/data/models/order_model.dart';
import 'package:patient_app/features/orders_log/data/repository/order_log_repo.dart';

class OrderLogRepoFake implements OrderLogRepo {
  @override
  Future<Either<ApiErrorModel, List<OrderModel>>> getOrders() async {

    await Future.delayed(const Duration(seconds: 2));

    Map<String, dynamic> response = {
      "statusCode": 200,
      "message": "Orders retrieved successfully",
      "data": [
        {
          "id": "82a6fd47-aaaf-43b7-8612-96eca49af33f",
          "oredrDate": "2025-05-18T14:59:19.8545728",
          "status": "Pending",
          "deliveryPrice": 31370.41,
          "totalPrice": 31410.41,
          "userName": "Hamza Mosaad Mohamed",
          "userEmail": "hamzamosd@gmail.com",
          "userAddress": "Tanta,Saeed ST",
          "ar_BranchName": "اسم",
          "en_BranchName": "some name",
          "orderItems": [
            {
              "id": "d10b5fb1-8bcb-449d-b3ce-6bd080b9dde3",
              "orderId": "82a6fd47-aaaf-43b7-8612-96eca49af33f",
              "systemProductCode": "3fa85f64-5717-4562-b3fc-2c963f66afa7",
              "systemProductPrice": 10,
              "systemProductImage": "s",
              "systemProductName": "as",
              "quantity": 4
            }
          ]
        },
        {
          "id": "dccc92d9-4117-4e7e-92de-98287fff8daf",
          "oredrDate": "2025-05-18T14:52:44.4398349",
          "status": "Pending",
          "deliveryPrice": 31370.41,
          "totalPrice": 31390.41,
          "userName": "Hamza Mosaad Mohamed",
          "userEmail": "hamzamosd@gmail.com",
          "userAddress": "Tanta,Saeed ST",
          "ar_BranchName": "اسم",
          "en_BranchName": "some name",
          "orderItems": [
            {
              "id": "c9182cf1-83ef-4970-8d20-3f19a5fd3315",
              "orderId": "dccc92d9-4117-4e7e-92de-98287fff8daf",
              "systemProductCode": "3fa85f64-5717-4562-b3fc-2c963f66afa7",
              "systemProductPrice": 10,
              "systemProductImage": "s",
              "systemProductName": "as",
              "quantity": 2
            }
          ]
        },
        {
          "id": "a873ef15-d098-4c5f-8fea-a9e5503901a4",
          "oredrDate": "2025-06-23T12:31:42.4597653",
          "status": "Pending",
          "deliveryPrice": 31370.41,
          "totalPrice": 31430.41,
          "userName": "Hamza Mosaad Mohamed",
          "userEmail": "hamzamosd@gmail.com",
          "userAddress": "Tanta,Saeed ST",
          "ar_BranchName": "اسم",
          "en_BranchName": "some name",
          "orderItems": [
            {
              "id": "b37a9756-5e01-436e-b203-bb05aadce185",
              "orderId": "a873ef15-d098-4c5f-8fea-a9e5503901a4",
              "systemProductCode": "3fa85f64-5717-4562-b3fc-2c963f66afa8",
              "systemProductPrice": 20,
              "systemProductImage": "s",
              "systemProductName": "Med",
              "quantity": 2
            },
            {
              "id": "6456a0e1-4321-4e7f-849e-e565fc97d442",
              "orderId": "a873ef15-d098-4c5f-8fea-a9e5503901a4",
              "systemProductCode": "3fa85f64-5717-4562-b3fc-2c963f66afa7",
              "systemProductPrice": 10,
              "systemProductImage": "s",
              "systemProductName": "as",
              "quantity": 2
            }
          ]
        },
        {
          "id": "9cf1dc62-ce7a-4904-83fa-ba45c5dfd84d",
          "oredrDate": "2025-05-18T15:06:12.3527878",
          "status": "Pending",
          "deliveryPrice": 31370.41,
          "totalPrice": 31590.41,
          "userName": "Hamza Mosaad Mohamed",
          "userEmail": "hamzamosd@gmail.com",
          "userAddress": "Tanta,Saeed ST",
          "ar_BranchName": "اسم",
          "en_BranchName": "some name",
          "orderItems": [
            {
              "id": "5a48a06d-557d-4451-a333-338522d9001b",
              "orderId": "9cf1dc62-ce7a-4904-83fa-ba45c5dfd84d",
              "systemProductCode": "3fa85f64-5717-4562-b3fc-2c963f66afa7",
              "systemProductPrice": 10,
              "systemProductImage": "s",
              "systemProductName": "as",
              "quantity": 2
            },
            {
              "id": "c4439fab-dac2-4909-8e8e-8e5b8371beac",
              "orderId": "9cf1dc62-ce7a-4904-83fa-ba45c5dfd84d",
              "systemProductCode": "3fa85f64-5717-4562-b3fc-2c963f66afa8",
              "systemProductPrice": 20,
              "systemProductImage": "s",
              "systemProductName": "Med",
              "quantity": 10
            }
          ]
        },
        {
          "id": "92d3411d-f15d-432f-86d6-baae83af6ba5",
          "oredrDate": "2025-05-18T15:12:06.7751688",
          "status": "Pending",
          "deliveryPrice": 31370.41,
          "totalPrice": 31590.41,
          "userName": "Hamza Mosaad Mohamed",
          "userEmail": "hamzamosd@gmail.com",
          "userAddress": "Tanta,Saeed ST",
          "ar_BranchName": "اسم",
          "en_BranchName": "some name",
          "orderItems": [
            {
              "id": "dbb4c5a2-420d-4f21-8e00-0fcca01d26c3",
              "orderId": "92d3411d-f15d-432f-86d6-baae83af6ba5",
              "systemProductCode": "3fa85f64-5717-4562-b3fc-2c963f66afa8",
              "systemProductPrice": 20,
              "systemProductImage": "s",
              "systemProductName": "Med",
              "quantity": 10
            },
            {
              "id": "70ce0871-ad96-4628-b68f-439083d1b932",
              "orderId": "92d3411d-f15d-432f-86d6-baae83af6ba5",
              "systemProductCode": "3fa85f64-5717-4562-b3fc-2c963f66afa7",
              "systemProductPrice": 10,
              "systemProductImage": "s",
              "systemProductName": "as",
              "quantity": 2
            }
          ]
        }
      ]
    };

    try {
      List<OrderModel> orders = [];
      for (var order in response['data']) {
        final orderList = order['orderItems'];
        if (orderList.isEmpty) {
          continue;
        } else {
          for (var item in orderList) {
            orders.add(OrderModel.fromJson(item));
          }
        }
      }
      log('Orders: ${orders.length}');
      return Right(orders);
    } catch (e) {
      return Left(
        ApiErrorModel(
          statusCode: response['statusCode'],
          message: response['message'],
        ),
      );
    }
  }
}
