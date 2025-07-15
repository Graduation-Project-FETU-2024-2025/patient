import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/widgets/search_text_field.dart';
import 'package:patient_app/features/orders/presentation/view/widgets/custom_cart_button.dart';
import 'package:patient_app/features/orders/presentation/view/widgets/custom_medicine_card_grid.dart';
import 'package:patient_app/features/orders/presentation/view_model/order_cubit/order_cubit.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.0.w),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: CustomCartButton(),
            ),
            SliverToBoxAdapter(
              child: Gap(40.h),
            ),
            SliverToBoxAdapter(
              child: SearchTextField(
                controller: context.read<OrderCubit>().searchController,
                onChanged: (value) async {
                  Future.delayed(const Duration(milliseconds: 500), () {
                    // Simulate a search operation
                    if (context.mounted) {
                      context.read<OrderCubit>().searchMedicine(value);
                    }
                  });
                },
                onPressed: () {},
              ),
            ),
            SliverToBoxAdapter(
              child: Gap(60.h),
            ),
            const CustomMedicineCardGrid(),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  Gap(20.h),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  // const MakeOrderButtonBlocConsumer(), // TODO: Remove it if it's not used
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


