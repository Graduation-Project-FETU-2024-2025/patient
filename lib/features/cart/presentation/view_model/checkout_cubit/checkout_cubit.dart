import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/database/cache/cache_keys.dart';
import 'package:patient_app/core/database/cache/cashe_helper.dart';
import 'package:patient_app/core/services/get_it.dart';
import 'package:patient_app/features/cart/data/models/make_order_request_model.dart';
import 'package:patient_app/features/cart/data/models/payment_request_model.dart';
import 'package:patient_app/features/cart/data/repository/checkout_repo.dart';
import 'package:patient_app/features/cart/presentation/view_model/checkout_cubit/checkout_state.dart';
import 'package:patient_app/core/models/medicine_model.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this._checkoutRepo) : super(CheckoutInitial());
  final CheckoutRepo _checkoutRepo;
  List<MedicineModel> medicinesInCart = [];

  void setMedicinesInCart(List<MedicineModel> medicines) {
    medicinesInCart = medicines;
  }

  void updateItemCount(
      {required String systemProductCode, required int count}) {
    medicinesInCart = medicinesInCart.map((e) {
      if (e.systemProductCode == systemProductCode) {
        return e.copyWith(quantity: count);
      }
      return e;
    }).toList();
    emit(ItemCountUpdated(medicinesInCart: medicinesInCart));
  }

  double _calculateTotalPrice() {
    double totalPrice = medicinesInCart.fold(
      0.0,
      (previousValue, medicine) =>
          previousValue + (medicine.price * medicine.quantity),
    );
    log('Total Price: $totalPrice');
    return totalPrice;
  }

  void removeFromCart({required String systemProductCode}) {
    medicinesInCart.removeWhere(
        (medicine) => medicine.systemProductCode == systemProductCode);
    emit(ItemCountUpdated(medicinesInCart: medicinesInCart));
  }

  void clearCart() {
    medicinesInCart.clear();
    emit(ItemCountUpdated(medicinesInCart: medicinesInCart));
  }

  void makeOrder() async {
    emit(OrderMakingLoading());
    final cache = getIt<CacheHelper>();
    final orderRequest = MakeOrderRequestModel(
      userName: cache.getString(key: CacheKeys.username) ?? '',
      userEmail: cache.getString(key: CacheKeys.email) ?? '',
      userAddress: '',
      userLat: 0,
      userLong: 0,
      branchId: medicinesInCart.first.branchId,
      orderItems: medicinesInCart.map((medicine) {
        return OrderItem(
          systemProductCode: medicine.systemProductCode,
          systemProductPrice: medicine.price,
          quantity: medicine.quantity,
        );
      }).toList(),
    );
    final result = await _checkoutRepo.makeOrder(orderRequest: orderRequest);

    result.fold(
      (error) {
        log('Error making order: ${error.message}');
        emit(OrderMakingFailure(errorModel: error));
      },
      (orderId) async {
        log('Order made successfully: $orderId');
        final paymentResult = await _checkoutRepo.makePayment(
          paymentRequest: PaymentRequestModel(
            orderId: orderId,
            amount: _calculateTotalPrice(),
          ),
        );
        paymentResult.fold(
          (error) {
            log('Error making payment: ${error.message}');
            emit(OrderMakingFailure(errorModel: error));
          },
          (iframeUrl) {
            log('Payment made successfully, iframe URL: $iframeUrl');
            emit(OrderMakingSuccess(iframeUrl: iframeUrl));
          },
        );
      },
    );
  }

  Future<void> launchPaymentPage(String iframeUrl) async {
    final Uri url = Uri.parse(iframeUrl);
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
    log('Launching payment page with URL: $iframeUrl');
  }
}
