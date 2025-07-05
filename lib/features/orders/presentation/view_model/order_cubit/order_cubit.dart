import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/features/orders/data/repository/order_medicine_repo.dart';
import 'package:patient_app/features/orders/presentation/view_model/order_cubit/order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this._medicineRepo) : super(OrderInitial());
  final OrderMedicineRepo _medicineRepo;

  Future<void> searchMedicine(String query) async {
    emit(OrderLoading());
    final result = await _medicineRepo.searchMedicine(query);
    result.fold(
      (error) => emit(OrderLoadedFailure(errorModel: error)),
      (medicines) => emit(OrderLoadedSuccess(medicines: medicines)),
    );
  }
}
