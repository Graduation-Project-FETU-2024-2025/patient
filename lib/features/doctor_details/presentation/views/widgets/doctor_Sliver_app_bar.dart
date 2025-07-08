import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:patient_app/core/database/cache/cashe_helper.dart';
import 'package:patient_app/core/functions/is_network_image.dart';
import 'package:patient_app/core/services/get_it.dart';
import 'package:patient_app/core/utils/app_icons.dart';
import 'package:patient_app/core/utils/app_images.dart';
import '../../../../../core/utils/app_colors.dart';

class DoctorSliverAppBar extends StatelessWidget {
  const DoctorSliverAppBar({
    super.key,
    required this.img,
    required this.isBtnValid,
    required this.height,
  });
  final String img;
  final bool isBtnValid;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: SvgPicture.asset(
          getIt<CacheHelper>().getCurrentLanguage() == 'en'
              ? AppIcons.svgsBack
              : AppIcons.svgsBackRight,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      expandedHeight: height,
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.black
          : AppColors.white,
      elevation: 0.0,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: isNetworkImage(img)
            ? CachedNetworkImage(
                imageUrl: img,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )
            : Image.asset(
                AppImages.imagesNoClinicImg,
                fit: BoxFit.cover,
              ),
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
      ),
      bottom: isBtnValid
          ? PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: Container(
                height: 32.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.black
                      : AppColors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32.0),
                    topRight: Radius.circular(32.0),
                  ),
                ),
                child: Container(
                  width: 85.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.white.withValues(alpha: 0.6)
                        : AppColors.black.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.0),
                      topRight: Radius.circular(32.0),
                    ),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
