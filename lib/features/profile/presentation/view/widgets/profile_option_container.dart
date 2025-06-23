import 'package:patient_app/core/database/cache/cache_keys.dart';
import 'package:patient_app/core/database/cache/secure_storage.dart';
import 'package:patient_app/core/global_cubits/change_themes_cubit/change_themes_cubit.dart';
import 'package:patient_app/core/helpers/extentions.dart';
import 'package:patient_app/core/routers/routing.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_icons.dart';
import 'package:patient_app/core/utils/app_images.dart';
import 'package:patient_app/features/profile/presentation/view/widgets/change_language_dialog.dart';
import 'package:patient_app/features/profile/presentation/view/widgets/profile_option_raw.dart';
import 'package:patient_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileOptionContainer extends StatelessWidget {
  const ProfileOptionContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.darkGray
            : AppColors.lightGray,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.gray, width: 1.5.w),
      ),
      child: Column(
        children: [
          ProfileOptionRaw(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => const Dialog(
                  child: ChangeLanguageDialog(),
                ),
              );
            },
            leading: SvgPicture.asset(AppIcons.svgsLanguage),
            title: S.of(context).language,
          ),
          ProfileOptionRaw(
            onTap: () {},
            leading: Image.asset(
              AppImages.imagesMedicinRecords,
              height: 24.h,
            ),
            title: S.of(context).medicineRecord,
          ),
          ProfileOptionRaw(
            onTap: () {},
            leading: Image.asset(
              AppImages.imagesOrderLog,
              height: 24.h,
            ),
            title: S.of(context).orderLog,
          ),
          ProfileOptionRaw(
            leading: SvgPicture.asset(AppIcons.svgsTheme),
            title: S.of(context).darkMode,
            trailing: Switch(
              activeColor: AppColors.black,
              activeTrackColor: AppColors.white,
              inactiveTrackColor: AppColors.black,
              inactiveThumbColor: AppColors.white,
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: (value) {
                context.read<ChangeThemesCubit>().changeAppTheme();
              },
            ),
          ),
          ProfileOptionRaw(
            onTap: () async {
              await SecureStorage.instance.deleteData(key: CacheKeys.token);
              await SecureStorage.instance.deleteData(key: CacheKeys.id);
              if (context.mounted) {
                context.pushNamedAndRemoveUntil(
                  Routing.signIn,
                  predicate: (route) => false,
                );
              }
            },
            leading: SvgPicture.asset(AppIcons.svgsLogout),
            title: S.of(context).logout,
            color: AppColors.red,
            divider: false, // No divider after logout option
          ),
        ],
      ),
    );
  }
}
