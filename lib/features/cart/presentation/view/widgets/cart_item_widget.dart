import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_icons.dart';
import 'package:patient_app/core/utils/app_styles.dart';
import 'package:patient_app/core/models/medicine_model.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget(
      {super.key,
      required this.medicineModel,
      required this.onPressDecrement,
      required this.onPressIncrement,
      this.onPressDelete});
  final MedicineModel medicineModel;
  final VoidCallback onPressDecrement;
  final VoidCallback onPressIncrement;
  final VoidCallback? onPressDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffF7F7F7),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: medicineModel.productImage,
            height: 66.h,
          ),
          Gap(20.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                medicineModel.productName,
                style: AppStyles.semiBold18(context),
              ),
              Text(
                medicineModel.pharmacyName,
                style: AppStyles.semiBold10(context)
                    .copyWith(fontSize: 8, color: AppColors.darkGray),
              ),
              Text(
                '\$${medicineModel.price}',
                style: AppStyles.semiBold18(context),
              ),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: onPressDelete,
                  icon: SvgPicture.asset(AppIcons.svgsDelete)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: onPressDecrement,
                    icon: const Icon(Icons.remove_circle_outline),
                  ),
                  Text(
                    medicineModel.quantity.toString(),
                    style: AppStyles.semiBold12(context),
                  ),
                  IconButton(
                    onPressed: onPressIncrement,
                    icon: const Icon(Icons.add_circle_outline),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
