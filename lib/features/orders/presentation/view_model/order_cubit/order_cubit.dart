import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/database/cache/cache_keys.dart';
import 'package:patient_app/core/database/cache/cashe_helper.dart';
import 'package:patient_app/core/services/get_it.dart';
import 'package:patient_app/features/orders/data/models/make_order_request_model.dart';
import 'package:patient_app/features/orders/data/models/medicine_model.dart';
import 'package:patient_app/features/orders/data/repository/order_medicine_repo.dart';
import 'package:patient_app/features/orders/presentation/view_model/order_cubit/order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this._medicineRepo) : super(OrderInitial());
  final OrderMedicineRepo _medicineRepo;
  List<MedicineModel> medicinesInCart = [];
  Future<void> searchMedicine(String query) async {
    emit(SearchLoading());
    final result = await _medicineRepo.searchMedicine(query);
    result.fold(
      (error) => emit(SearchLoadedFailure(errorModel: error)),
      (medicines) => emit(SearchLoadedSuccess(medicines: medicines)),
    );
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
          quantity: 0,
        );
      }).toList(),
    );
    final result = await _medicineRepo.makeOrder(orderRequest: orderRequest);

    result.fold(
      (error) {
        log('Error making order: ${error.message}');
        emit(OrderMakingFailure(errorModel: error));
      },
      (message) {
        log('Order made successfully: $message');
        emit(OrderMakingSuccess(message: message));
        medicinesInCart.clear(); // Clear the cart after successful order
      },
    );
  }

  bool isMedicineInCart(MedicineModel medicine) {
    return medicinesInCart.contains(medicine);
  }

  void addToCart(MedicineModel medicine) {
    if (!medicinesInCart.contains(medicine)) {
      medicinesInCart.add(medicine);
    }
  }

  void removeFromCart(MedicineModel medicine) {
    medicinesInCart.remove(medicine);
  }
}
