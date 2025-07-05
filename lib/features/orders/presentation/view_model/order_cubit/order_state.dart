import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/features/orders/data/models/medicine_model.dart';

sealed class OrderState {}

final class OrderInitial extends OrderState {}

final class OrderLoading extends OrderState {}

final class OrderLoadedSuccess extends OrderState {
  final List<MedicineModel> medicines;

  OrderLoadedSuccess({required this.medicines});
}

final class OrderLoadedFailure extends OrderState {
  final ApiErrorModel errorModel;

  OrderLoadedFailure({required this.errorModel});
}
