import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/utils/app_icons.dart';
import 'package:patient_app/core/widgets/custom_button.dart';
import 'package:patient_app/core/widgets/search_text_field.dart';
import 'package:patient_app/features/orders/presentation/view/widgets/custom_medicine_card_grid.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.0.w),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Align(
                alignment: AlignmentDirectional.topEnd,
                child: CircleAvatar(
                    radius: 15.r,
                    backgroundColor: const Color(0xffD9E1F9),
                    child: SvgPicture.asset(AppIcons.svgsCart)),
              ),
            ),
            SliverToBoxAdapter(
              child: Gap(40.h),
            ),
            SliverToBoxAdapter(
              child: SearchTextField(
                controller: TextEditingController(),
                onChanged: (value) async {
                  Future.delayed(const Duration(milliseconds: 500), () {
                    // Simulate a search operation
                    log('Searching for: $value');
                  });
                },
                onPressed: () {},
              ),
            ),
            SliverToBoxAdapter(
              child: Gap(60.h),
            ),
            const CustomMedicineCardGrid(),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  Gap(20.h),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  CustomButton(onPressed: () {}, text: 'Add to Cart'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
