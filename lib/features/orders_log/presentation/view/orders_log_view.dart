import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/features/orders_log/presentation/view/widgets/order_log_bloc_builder.dart';
import 'package:patient_app/features/orders_log/presentation/view/widgets/order_logs_app_bar.dart';

import '../view_model/cubit/order_log_cubit.dart';

class OrdersLogView extends StatelessWidget {
  const OrdersLogView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async{
        context.read<OrderLogCubit>().getOrders();
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(32.0.w),
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: OrderLogsAppBar()),
                SliverToBoxAdapter(child: Gap(50.h)),
               const OrdersLogBlocBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

