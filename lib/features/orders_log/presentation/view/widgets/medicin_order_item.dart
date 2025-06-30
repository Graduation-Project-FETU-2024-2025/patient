import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/functions/is_network_image.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_icons.dart';
import 'package:patient_app/core/utils/app_images.dart';
import 'package:patient_app/core/utils/app_styles.dart';
import 'package:patient_app/features/orders_log/data/models/order_model.dart';

class MedicineOrderItem extends StatelessWidget {
  const MedicineOrderItem({
    super.key,
    required this.orderModel,
  });
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isNetworkImage(orderModel.systemProductImage)
            ? Image.network(orderModel.systemProductImage)
            : Image.asset(AppImages.imagesMedicin),
        Gap(12.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              orderModel.systemProductName,
              style: AppStyles.semiBold18(context),
            ),
            Gap(8.h),
            Text(
              '',
              style: AppStyles.semiBold12(context).copyWith(
                color: const Color(0xFF8A8A8A),
              ),
            ),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            orderModel.status == 'Pending'
                ? IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppIcons.svgsDelete),
                  )
                : const SizedBox(),
            Text(
              '\$${orderModel.systemProductPrice}',
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
