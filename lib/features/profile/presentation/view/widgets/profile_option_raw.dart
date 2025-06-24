import 'package:flutter/material.dart';
import 'package:patient_app/core/utils/app_styles.dart';

class ProfileOptionRaw extends StatelessWidget {
  const ProfileOptionRaw(
      {super.key,
      this.onTap,
      this.trailing,
      this.divider = true,
      required this.leading,
      required this.title, this.color});
  final VoidCallback? onTap;
  final Widget leading;
  final Widget? trailing;
  final String title;
  final bool divider;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: leading,
          title: Text(
            title,
            style: AppStyles.medium16(context).copyWith(
              color: color,
            ),
          ),
          trailing: trailing ?? const Icon(Icons.arrow_forward_ios),
        ),
        divider ? const Divider() : const SizedBox.shrink(),
      ],
    );
  }
}
