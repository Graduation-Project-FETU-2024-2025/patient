import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/features/orders/data/models/medicine_model.dart';

sealed class OrderState {}

final class OrderInitial extends OrderState {}

final class SearchLoading extends OrderState {}

final class SearchLoadedSuccess extends OrderState {
  final List<MedicineModel> medicines;

  SearchLoadedSuccess({required this.medicines});
}

final class SearchLoadedFailure extends OrderState {
  final ApiErrorModel errorModel;

  SearchLoadedFailure({required this.errorModel});
}


final class OrderMakingLoading extends OrderState {}


final class OrderMakingSuccess extends OrderState {
  final String message;

  OrderMakingSuccess({required this.message});
}


final class OrderMakingFailure extends OrderState {
  final ApiErrorModel errorModel;

  OrderMakingFailure({required this.errorModel});
}
