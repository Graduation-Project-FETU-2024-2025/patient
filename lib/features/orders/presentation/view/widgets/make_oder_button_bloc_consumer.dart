import 'package:flutter/material.dart';
import 'package:patient_app/core/widgets/custom_button.dart';
import 'package:patient_app/generated/l10n.dart';

class MakeOrderButtonBlocConsumer extends StatelessWidget {
  const MakeOrderButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Directly show the button, no BlocConsumer
    return CustomButton(
      onPressed: () {
        // context.read<CartCubit>().addItemToCart(
        //     medicines: context.read<OrderCubit>().medicinesInCart);
      },
      text: S.of(context).makeOrder,
    );
  }
}
