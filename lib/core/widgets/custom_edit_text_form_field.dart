import 'package:flutter/material.dart';
import 'package:patient_app/core/utils/app_colors.dart';

class CustomEditTextFormField extends StatelessWidget {
  const CustomEditTextFormField(
      {super.key,
      required this.controller,
      required this.hintTxt,
      this.initialVal,
      this.maxLines,
      this.suffixIcon,
      this.keyboardType,
      this.validator,
      this.readOnly});
  final TextEditingController controller;
  final String? initialVal;
  final String hintTxt;
  final int? maxLines;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    if (initialVal != null && controller.text.isEmpty) {
      controller.text = initialVal!;
    }
    return TextFormField(
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      style: Theme.of(context)
          .textTheme
          .labelMedium!
          .copyWith(color: AppColors.primaryColor),
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      readOnly: readOnly ?? false,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        fillColor: Colors.transparent,
        contentPadding: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
        hintText: hintTxt,
        hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.black.withOpacity(0.3)
                : AppColors.white.withOpacity(0.3)),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:
              BorderSide(width: 1, color: AppColors.black.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.black.withOpacity(0.3)
                : AppColors.primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.black.withOpacity(0.3)
                : AppColors.white.withOpacity(0.6),
          ),
        ),
      ),
    );
  }
}
