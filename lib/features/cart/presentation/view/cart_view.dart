import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/models/medicine_model.dart';
import 'package:patient_app/features/cart/presentation/view/widgets/cart_view_body.dart';
import 'package:patient_app/features/cart/presentation/view/widgets/checkout_button_bloc_consumer.dart';
import 'package:patient_app/features/cart/presentation/view_model/checkout_cubit/checkout_cubit.dart';

class CartView extends StatefulWidget {
  const CartView({
    super.key,
    required this.medicinesInCart,
  });
  final List<MedicineModel> medicinesInCart;

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    context.read<CheckoutCubit>().setMedicinesInCart(widget.medicinesInCart);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: CheckoutButtonBlocConsumer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: CartViewBody(),
    );
  }
}
