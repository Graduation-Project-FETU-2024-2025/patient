import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/functions/is_network_image.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_images.dart';
import 'package:patient_app/core/utils/app_styles.dart';
import 'package:patient_app/core/models/medicine_model.dart';
import 'package:patient_app/features/orders/presentation/view/widgets/add_to_cart_button.dart';

class CustomMedicineCard extends StatelessWidget {
  const CustomMedicineCard({
    super.key,
    this.medicine,
  });
  final MedicineModel? medicine;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? AppColors.white
            : AppColors.darkWhite,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.light
              ? AppColors.gray
              : AppColors.darkGray,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: isNetworkImage(medicine?.productImage)
                    ? CachedNetworkImage(
                        imageUrl: medicine!.productImage,
                        fit: BoxFit.cover,
                        height: 100,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error,
                        ),
                      )
                    : Image.asset(
                        AppImages.imagesMedicin,
                        fit: BoxFit.cover,
                        height: 100,
                      ),
              ),
              medicine != null
                  ? AddToCartButton(
                      medicineModel: medicine!,
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          Gap(5.h),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      medicine?.productName ?? 'Medicine',
                      style: AppStyles.semiBold14(context),
                    ),
                    Text(
                      medicine?.pharmacyName ?? 'Pharmacy',
                      style: AppStyles.semiBold10(context).copyWith(
                        color: AppColors.gray,
                      ),
                    ),
                  ],
                ),
                Gap(30.w),
                Text(
                  '\$${medicine?.price ?? 0.0}',
                  style: AppStyles.semiBold12(context)
                      .copyWith(color: AppColors.primaryColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
