import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_app/core/utils/app_images.dart';

class AdvertisingItem extends StatelessWidget {
  const AdvertisingItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        end: 50,
      ),
      child: AspectRatio(
        aspectRatio: 239 / 211,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Image.asset(AppImages.imagesAdvertise, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
