import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/functions/is_network_image.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_images.dart';
import 'package:patient_app/core/utils/app_styles.dart';
import 'package:patient_app/features/orders_log/data/models/order_model.dart';
import 'package:patient_app/features/orders_log/presentation/view/widgets/delete_order_bloc_listener.dart';

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
            ? CachedNetworkImage(
                imageUrl: orderModel.systemProductImage,
                height: 123.h,
              )
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
                ? DeleteOrderBlocListener(
                    orderId: orderModel.orderId,
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


