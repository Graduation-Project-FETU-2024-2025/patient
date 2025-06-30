import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:patient_app/core/helpers/extentions.dart';
import 'package:patient_app/core/utils/app_icons.dart';
import 'package:patient_app/core/widgets/toast.dart';
import 'package:patient_app/features/orders_log/presentation/view_model/cubit/order_log_cubit.dart';
import 'package:patient_app/features/orders_log/presentation/view_model/cubit/order_log_state.dart';
import 'package:patient_app/generated/l10n.dart';

class DeleteOrderBlocListener extends StatelessWidget {
  const DeleteOrderBlocListener({
    super.key,
    required this.orderId,
  });
  final String orderId;
  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderLogCubit, OrderLogState>(
      listenWhen: (previous, current) =>
          current is OrderLogDeleted ||
          current is OrderLogDeletedFailure ||
          current is OrderLogDeleting,
      listener: (context, state) {
        if (state is OrderLogDeleting) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Dialog(
              backgroundColor: Colors.transparent,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        if (state is OrderLogDeleted) {
          context.pop();
          successToast(message: state.message);
          context.read<OrderLogCubit>().getOrders();
        }
        if (state is OrderLogDeletedFailure) {
          context.pop();
          errorToast(
            message:
                state.errorModel.message ?? S.of(context).someThingWentWrong,
          );
        }
      },
      child: IconButton(
        onPressed: () {
          context.read<OrderLogCubit>().deleteOrder(orderId);
        },
        icon: SvgPicture.asset(AppIcons.svgsDelete),
      ),
    );
  }
}
