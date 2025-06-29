import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/features/orders_log/presentation/view/widgets/order_log_success_body.dart';
import 'package:patient_app/features/orders_log/presentation/view/widgets/order_logs_app_bar.dart';
import 'package:patient_app/features/orders_log/presentation/view_model/cubit/order_log_cubit.dart';
import 'package:patient_app/features/orders_log/presentation/view_model/cubit/order_log_state.dart';
import 'package:patient_app/generated/l10n.dart';

class OrdersLogView extends StatelessWidget {
  const OrdersLogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(32.0.w),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: OrderLogsAppBar()),
              SliverToBoxAdapter(child: Gap(50.h)),
              BlocBuilder<OrderLogCubit, OrderLogState>(
                builder: (context, state) {
                  if (state is OrderLogLoaded) {
                    return OrderLogSuccessBody(orders: state.orders);
                  } else if (state is OrderLogError) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Text(state.error.message ??
                            S.of(context).someThingWentWrong),
                      ),
                    );
                  }
                  return const SliverToBoxAdapter(
                    child:  Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

