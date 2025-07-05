import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/features/orders/data/models/medicine_model.dart';
import 'package:patient_app/features/orders/presentation/view_model/order_cubit/order_cubit.dart';

class AddToCartButton extends StatefulWidget {
  const AddToCartButton({super.key, required this.medicineModel});
  final MedicineModel medicineModel;

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value:
            context.read<OrderCubit>().isMedicineInCart(widget.medicineModel),
        onChanged: (value) {
          if (value == true) {
            context.read<OrderCubit>().addToCart(widget.medicineModel);
          } else {
            context.read<OrderCubit>().removeFromCart(widget.medicineModel);
          }
          setState(() {
          });
        });
  }
}
