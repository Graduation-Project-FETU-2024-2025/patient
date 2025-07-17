import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_icons.dart';
import 'package:patient_app/core/utils/app_styles.dart';
import 'package:patient_app/features/cart/presentation/view_model/checkout_cubit/checkout_cubit.dart';
import 'package:patient_app/generated/l10n.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.of(context).pop(context.read<CheckoutCubit>().medicinesInCart),
          icon: SvgPicture.asset(AppIcons.svgsBack),
        ),
        const Spacer(),
        Text(
          S.of(context).myCart,
          style: AppStyles.semiBold20(context)
              .copyWith(color: AppColors.primaryColor),
        ),
        const Spacer(),
      ],
    );
  }
}
