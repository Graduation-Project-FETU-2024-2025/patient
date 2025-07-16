import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:patient_app/generated/l10n.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField(
      {super.key, required this.controller, this.onPressed, this.onChanged});
  final TextEditingController controller;
  final void Function()? onPressed;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Theme.of(context).brightness == Brightness.light
            ? Color(0xffE5E5E5)
            : AppColors.darkWhite,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: TextField(
              onChanged: onChanged,
              controller: controller,
              onTapOutside: (v) {
                FocusScope.of(context).unfocus();
              },
              cursorHeight: 25,
              cursorColor: AppColors.primaryColor,
              style: Theme.of(context).textTheme.titleMedium,
              decoration: InputDecoration(
                hintText: S.of(context).searchHint,
                hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Color(0xffBDBDBD),
                    ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                filled: false,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    AppIcons.svgsSearch,
                    colorFilter: ColorFilter.mode(
                      Color(0xffBDBDBD),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 8,
              ),
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(30),
                      right: Radius.circular(30),
                    ),
                  ),
                ),
                child: Text(
                  S.of(context).search,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.white,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
