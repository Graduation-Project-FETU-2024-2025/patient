
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:patient_app/core/helpers/extentions.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_icons.dart';
import 'package:patient_app/core/utils/app_styles.dart';
import 'package:patient_app/generated/l10n.dart';


class OrderLogsAppBar extends StatelessWidget {
  const OrderLogsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            context.pop();
          },
          alignment: AlignmentDirectional.topStart,
          icon: SvgPicture.asset(
            AppIcons.svgsBack,
          ),
        ),
        const Spacer(),
        Text(
          S.of(context).orderLog,
          style: AppStyles.semiBold20(context)
              .copyWith(color: AppColors.primaryColor),
        ),
        const Spacer(),
      ],
    );
  }
}
