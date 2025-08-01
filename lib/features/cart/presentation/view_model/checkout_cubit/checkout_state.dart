import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/core/models/medicine_model.dart';

sealed class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}

final class OrderMakingLoading extends CheckoutState {}

final class OrderMakingSuccess extends CheckoutState {
  final String iframeUrl;

  OrderMakingSuccess({required this.iframeUrl});
}

final class OrderMakingFailure extends CheckoutState {
  final ApiErrorModel errorModel;

  OrderMakingFailure({required this.errorModel});
}

final class ItemCountUpdated extends CheckoutState {
  final List<MedicineModel> medicinesInCart;

  ItemCountUpdated({required this.medicinesInCart});
}
