import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/widgets/custom_button.dart';
import 'package:patient_app/features/cart/presentation/view_model/checkout_cubit/checkout_cubit.dart';
import 'package:patient_app/features/cart/presentation/view_model/checkout_cubit/checkout_state.dart';
import 'package:patient_app/generated/l10n.dart';

class CheckoutButtonBlocConsumer extends StatelessWidget {
  const CheckoutButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return CustomButton(
          onPressed: () {
            context.read<CheckoutCubit>().calculateTotalPrice();
          },
          text: S.of(context).checkout,
        );
      },
    );
  }
}
