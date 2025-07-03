import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/widgets/no_item_widget.dart';
import 'package:patient_app/features/orders_log/presentation/view/widgets/order_log_success_body.dart';
import 'package:patient_app/features/orders_log/presentation/view/widgets/shimmer_medicine_order_item.dart';
import 'package:patient_app/features/orders_log/presentation/view_model/cubit/order_log_cubit.dart';
import 'package:patient_app/features/orders_log/presentation/view_model/cubit/order_log_state.dart';
import 'package:patient_app/generated/l10n.dart';

class OrdersLogBlocBuilder extends StatelessWidget {
  const OrdersLogBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderLogCubit, OrderLogState>(
      buildWhen: (previous, current) =>
          current is OrderLogLoading ||
          current is OrderLogLoaded ||
          current is OrderLogError,
      builder: (context, state) {
        if (state is OrderLogLoaded) {
          return state.orders.isEmpty
              ? SliverToBoxAdapter(
                  child: NoItemWidget(
                  message: S.of(context).noOrdersYet,
                ))
              : OrderLogSuccessBody(orders: state.orders);
        } else if (state is OrderLogError) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                state.error.message ?? S.of(context).someThingWentWrong,
              ),
            ),
          );
        }
        return SliverToBoxAdapter(
            child: Column(
          children: List.generate(
            5,
            (index) => const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: ShimmerMedicineOrderItem(),
            ),
          ),
        ));
      },
    );
  }
}
