import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_app/core/widgets/no_item_widget.dart';
import 'package:patient_app/features/orders/presentation/view/widgets/custom_medicine_card.dart';
import 'package:patient_app/features/orders/presentation/view/widgets/success_body.dart';
import 'package:patient_app/features/orders/presentation/view_model/order_cubit/order_cubit.dart';
import 'package:patient_app/features/orders/presentation/view_model/order_cubit/order_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomMedicineCardGrid extends StatelessWidget {
  const CustomMedicineCardGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      buildWhen: (previous, current) =>
          current is SearchLoadedSuccess ||
          current is SearchLoading ||
          current is SearchLoadedFailure ||
          current is OrderInitial,
      builder: (context, state) {
        if (state is SearchLoadedSuccess) {
          return SuccessBody(medicines: state.medicines);
        } else if (state is SearchLoadedFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text('Error: ${state.errorModel.message}'),
            ),
          );
        } else if (state is SearchLoading) {
          return SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20.h,
              crossAxisSpacing: 20.w,
              childAspectRatio: .9,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const Skeletonizer(
                  enabled: true,
                  child: CustomMedicineCard(),
                );
              },
              childCount: 4,
            ),
          );
        } else if (state is OrderInitial) {
          return const SliverToBoxAdapter(
              child: NoItemWidget(message: 'Start searching for medicines'));
        }
        return const SliverToBoxAdapter(
          child: SizedBox.shrink(),
        );
      },
    );
  }
}
