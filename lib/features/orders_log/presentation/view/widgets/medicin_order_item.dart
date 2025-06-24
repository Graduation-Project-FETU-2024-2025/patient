import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_styles.dart';
import 'package:patient_app/features/orders_log/presentation/data/models/order_model.dart';

class MedicineOrderItem extends StatelessWidget {
  const MedicineOrderItem({
    super.key, required this.orderModel,
  });
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(orderModel.medicineImage),
        Gap(12.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              orderModel.medicineName,
              style: AppStyles.semiBold18(context),
            ),
            Gap(8.h),
            Text(
              orderModel.medicineActive,
              style: AppStyles.semiBold12(context).copyWith(
                color: const Color(0xFF8A8A8A),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/svgs/delete.svg'),
            ),
            Text(
              '\$${orderModel.price}',
              style: AppStyles.semiBold20(context).copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ],
        )
      ],
    );
  }
}
