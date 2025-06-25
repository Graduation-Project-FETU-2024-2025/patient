import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_styles.dart';

class PatientDetailsSection extends StatelessWidget {
  const PatientDetailsSection({
    super.key,
    required this.imageUrl,
    required this.name,
  });

  final String imageUrl;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 50.r,
          // backgroundImage: CachedNetworkImageProvider(
          //   imageUrl,
          // ),
          backgroundImage: AssetImage(imageUrl),
        ),
        Gap(15.w),
        Text(
          name,
          style: AppStyles.semiBold20(context),
        ),
      ],
    );
  }
}
