import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/global_cubits/cart_cubit/cart_cubit.dart';
import 'package:patient_app/core/widgets/custom_button.dart';
import 'package:patient_app/core/widgets/custom_loading_widget.dart';
import 'package:patient_app/core/widgets/toast.dart';
import 'package:patient_app/features/orders/presentation/view_model/order_cubit/order_cubit.dart';
import 'package:patient_app/features/orders/presentation/view_model/order_cubit/order_state.dart';
import 'package:patient_app/generated/l10n.dart';

class MakeOrderButtonBlocConsumer extends StatelessWidget {
  const MakeOrderButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderState>(
      listenWhen: (previous, current) =>
          current is OrderMakingSuccess || current is OrderMakingFailure,
      buildWhen: (previous, current) =>
          current is OrderMakingLoading ||
          current is OrderMakingSuccess ||
          current is OrderMakingFailure,
      listener: (context, state) {
        if (state is OrderMakingSuccess) {
          successToast(message: state.message);
        }
        if (state is OrderMakingFailure) {
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
                  // context.read<OrderCubit>().makeOrder();
                  context.read<CartCubit>().addItemToCart(
                      medicines: context.read<OrderCubit>().medicinesInCart);
                },
                text: S.of(context).makeOrder,
              );
      },
    );
  }
}
