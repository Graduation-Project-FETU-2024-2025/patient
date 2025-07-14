import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:patient_app/core/global_cubits/cart_cubit/cart_cubit.dart';
import 'package:patient_app/core/global_cubits/cart_cubit/cart_state.dart';
import 'package:patient_app/core/utils/app_icons.dart';

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
        child: BlocBuilder<CartCubit, CartState>(
          buildWhen: (previous, current) => current is GetCartProducts,
          builder: (context, state) {
            return Badge.count(
              count: context.read<CartCubit>().medicinesInCart.length,
              child: CircleAvatar(
                radius: 20.r,
                backgroundColor: const Color(0xffD9E1F9),
                child: IconButton(
                  onPressed: () {},
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
