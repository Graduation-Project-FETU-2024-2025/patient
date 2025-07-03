import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:patient_app/core/database/cache/cashe_helper.dart';
import 'package:patient_app/core/services/get_it.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_icons.dart';
import 'package:patient_app/core/utils/app_styles.dart';
import 'package:patient_app/generated/l10n.dart';

class MakeAppointmentAppBar extends StatelessWidget {
  const MakeAppointmentAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 30, top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: getIt<CacheHelper>().getCurrentLanguage() == 'en'
                ? SvgPicture.asset(
                    AppIcons.svgsBack,
                  )
                : SvgPicture.asset(
                    AppIcons.svgsBackRight,
                  ),
          ),
          Text(
            S.of(context).bookAppointment,
            style: AppStyles.semiBold20(context).copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(
            width: 80.w,
          ),
        ],
      ),
    );
  }
}
