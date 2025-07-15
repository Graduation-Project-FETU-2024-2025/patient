import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/features/cart/presentation/view/widgets/cart_item_widget.dart';
import 'package:patient_app/features/cart/presentation/view_model/checkout_cubit/checkout_cubit.dart';
import 'package:patient_app/features/cart/presentation/view_model/checkout_cubit/checkout_state.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CheckoutCubit>();
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        return SliverList.builder(
          itemCount: cubit.medicinesInCart.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: CartItemWidget(
              onPressDecrement: () {
                if (cubit.medicinesInCart[index].quantity >= 1) {
                  context.read<CheckoutCubit>().updateItemCount(
                        systemProductCode:
                            cubit.medicinesInCart[index].systemProductCode,
                        count: cubit.medicinesInCart[index].quantity - 1,
                      );
                }
              },
              onPressIncrement: () {
                if (cubit.medicinesInCart[index].amountInStock >
                    cubit.medicinesInCart[index].quantity) {
                  context.read<CheckoutCubit>().updateItemCount(
                        systemProductCode:
                            cubit.medicinesInCart[index].systemProductCode,
                        count: cubit.medicinesInCart[index].quantity + 1,
                      );
                }
              },
              onPressDelete: () {
                log(cubit.medicinesInCart[index].quantity.toString());
              },
              medicineModel: cubit.medicinesInCart[index],
            ),
          ),
        );
      },
    );
  }
}
