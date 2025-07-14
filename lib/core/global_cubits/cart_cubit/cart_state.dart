import 'package:patient_app/features/orders/data/models/medicine_model.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class GetCartProducts extends CartState {
  final List<MedicineModel> medicines;

  GetCartProducts({required this.medicines});
}
