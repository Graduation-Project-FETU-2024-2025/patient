import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:patient_app/core/helpers/extentions.dart';
import 'package:patient_app/core/routers/routing.dart';
import 'package:patient_app/core/utils/app_icons.dart';
import 'package:patient_app/features/orders/presentation/view_model/order_cubit/order_cubit.dart';
import 'package:patient_app/features/orders/presentation/view_model/order_cubit/order_state.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 8.0.w, top: 8.h),
      child: Align(
        alignment: AlignmentDirectional.topEnd,
        child: BlocBuilder<OrderCubit, OrderState>(
          buildWhen: (previous, current) => current is UpdateMedicineInCart,
          builder: (context, state) {
            return Badge.count(
              count: context.read<OrderCubit>().medicinesInCart.length,
              child: CircleAvatar(
                radius: 20.r,
                backgroundColor: const Color(0xffD9E1F9),
                child: IconButton(
                  onPressed: () {
                    context
                        .pushNamed(Routing.cart,
                            argument:
                                context.read<OrderCubit>().medicinesInCart)
                        .then((_) {
                      if (context.mounted) {
                        context.read<OrderCubit>().clearCart();
                      }
                    });
                  },
                  icon: SvgPicture.asset(
                    AppIcons.svgsCart,
                    height: 20.h,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
