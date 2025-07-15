import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/features/cart/presentation/view/widgets/cart_header.dart';
import 'package:patient_app/features/cart/presentation/view/widgets/cart_items_list.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.0.w),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: CartHeader(),
            ),
            SliverToBoxAdapter(
              child: Gap(60.h),
            ),
            const CartItemsList(),
          ],
        ),
      ),
    );
  }
}
