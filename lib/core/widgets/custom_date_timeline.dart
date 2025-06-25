import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/database/cache/cache_keys.dart';
import '../../../../../core/utils/app_colors.dart';
import '../database/cache/cashe_helper.dart';
import '../services/get_it.dart';
import '../utils/app_styles.dart';

class CustomDateTimeline extends StatefulWidget {
  const CustomDateTimeline({super.key});

  @override
  State<CustomDateTimeline> createState() => _CustomDateTimelineState();
}

class _CustomDateTimelineState extends State<CustomDateTimeline> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 80.h,
          child: DatePicker(
            DateTime.now(),
            width: 65.w,
            directionality: getIt<CacheHelper>()
                        .getString(key: CacheKeys.currentLanguage) ==
                    'en'
                ? TextDirection.ltr
                : TextDirection.rtl,
            locale: getIt<CacheHelper>()
                    .getString(key: CacheKeys.currentLanguage) ??
                'en',
            initialSelectedDate: DateTime.now(),
            dayTextStyle: AppStyles.semiBold12(context),
            monthTextStyle: AppStyles.semiBold12(context),
            dateTextStyle: AppStyles.semiBold12(context),
            selectionColor: AppColors.primaryColor,
            selectedTextColor: Colors.white,
            onDateChange: (date) {
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}
