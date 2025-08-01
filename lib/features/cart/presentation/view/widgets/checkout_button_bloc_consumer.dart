import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/widgets/custom_button.dart';
import 'package:patient_app/core/widgets/custom_loading_widget.dart';
import 'package:patient_app/core/widgets/toast.dart';
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
      buildWhen: (previous, current) =>
          current is OrderMakingLoading ||
          current is OrderMakingSuccess ||
          current is OrderMakingFailure,
      listenWhen: (previous, current) =>
          current is OrderMakingLoading ||
          current is OrderMakingSuccess ||
          current is OrderMakingFailure,
      listener: (context, state) async {
        if (state is OrderMakingSuccess) {
          successToast(message: 'Order created successfully');
          context.read<CheckoutCubit>().clearCart();
          await context
              .read<CheckoutCubit>()
              .launchPaymentPage(state.iframeUrl);
        } else if (state is OrderMakingFailure) {
          errorToast(
              message:
                  state.errorModel.message ?? S.of(context).someThingWentWrong);
        }
      },
      builder: (context, state) {
        return state is OrderMakingLoading
            ? const CustomLoadingWidget()
            : CustomButton(
                onPressed: () {
                  context.read<CheckoutCubit>().makeOrder();
                },
                text: S.of(context).checkout,
              );
      },
    );
  }
}
