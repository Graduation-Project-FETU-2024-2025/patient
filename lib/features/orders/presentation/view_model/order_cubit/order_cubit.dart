import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/models/medicine_model.dart';
import 'package:patient_app/features/orders/data/repository/order_medicine_repo.dart';
import 'package:patient_app/features/orders/presentation/view_model/order_cubit/order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this._medicineRepo) : super(OrderInitial());
  final OrderMedicineRepo _medicineRepo;
  final TextEditingController searchController = TextEditingController();
  List<MedicineModel> medicinesInCart = [];
  Timer? _debounce;

  Future<void> debounceSearch(String query) async {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _searchMedicine(query);
    });
  }

  Future<void> _searchMedicine(String query) async {
    emit(SearchLoading());
    final result = await _medicineRepo.searchMedicine(query);
    result.fold(
      (error) => emit(SearchLoadedFailure(errorModel: error)),
      (medicines) => emit(SearchLoadedSuccess(medicines: medicines)),
    );
  }

  void clearCart() {
    medicinesInCart.clear();
    searchController.clear();
    _searchMedicine('');
  }

  bool isMedicineInCart(MedicineModel medicine) {
    return medicinesInCart.contains(medicine);
  }

  void addToCart(MedicineModel medicine) {
    if (!medicinesInCart.contains(medicine)) {
      medicinesInCart.add(medicine);
    }
    emit(UpdateMedicineInCart());
  }

  void removeFromCart(MedicineModel medicine) {
    medicinesInCart.remove(medicine);
    emit(UpdateMedicineInCart());
  }

  @override
  Future<void> close() {
    searchController.dispose();
    _debounce?.cancel();
    return super.close();
  }
}
