import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:gap/gap.dart';

class ShimmerMedicineOrderItem extends StatelessWidget {
  const ShimmerMedicineOrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
      highlightColor: isDark ? Colors.grey.shade500 : Colors.grey.shade100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image placeholder
          Container(
            width: 123.w,
            height: 96.h,
            decoration: BoxDecoration(
              color: isDark ? Colors.grey.shade800 : Colors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          Gap(12.w),
          // Text placeholders
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 120.w,
                height: 18.h,
                color: isDark ? Colors.grey.shade800 : Colors.white,
              ),
              Gap(8.h),
              Container(
                width: 80.w,
                height: 12.h,
                color: isDark ? Colors.grey.shade800 : Colors.white,
              ),
            ],
          ),
          const Spacer(),
          // Delete icon and price placeholder
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 24.w,
                height: 24.h,
                color: isDark ? Colors.grey.shade800 : Colors.white,
              ),
              Gap(16.h),
              Container(
                width: 50.w,
                height: 20.h,
                color: isDark ? Colors.grey.shade800 : Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
