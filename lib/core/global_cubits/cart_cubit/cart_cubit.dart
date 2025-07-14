import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/global_cubits/cart_cubit/cart_state.dart';
import 'package:patient_app/features/orders/data/models/medicine_model.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  List<MedicineModel> medicinesInCart = [];

  void addItemToCart({required List<MedicineModel> medicines}) {
    medicinesInCart.addAll(medicines);
    getAllMedicinesInCart();
  }

  void removeItemFromCart({required String systemProductCode}) {
    medicinesInCart.removeWhere(
      (element) => element.systemProductCode == systemProductCode,
    );
    getAllMedicinesInCart();
  }

  void getAllMedicinesInCart() {
    emit(GetCartProducts(medicines: medicinesInCart));
  }
}
