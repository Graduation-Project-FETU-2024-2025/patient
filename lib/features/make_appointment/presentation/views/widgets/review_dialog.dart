import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_images.dart';
import 'package:patient_app/core/utils/app_styles.dart';
import 'package:patient_app/core/widgets/custom_button.dart';
import 'package:patient_app/core/widgets/custom_edit_text_form_field.dart';
import 'package:patient_app/features/make_appointment/presentation/view_models/add_review/add_review_cubit.dart';
import 'package:patient_app/generated/l10n.dart';

class ReviewDialog extends StatefulWidget {
  const ReviewDialog({
    super.key,
  });

  @override
  State<ReviewDialog> createState() => _ReviewDialogState();
}

class _ReviewDialogState extends State<ReviewDialog> {
  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddReviewCubit>();
    return SingleChildScrollView(
      child: AlertDialog(
        shadowColor: AppColors.darkWhite,
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? AppColors.white
            : AppColors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        content: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.7,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImages.imagesReservationSuccessfully),
                Gap(5.h),
                Text(
                  S.of(context).successfully,
                  style: AppStyles.medium30(context).copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                Gap(5.h),
                Text(
                  S.of(context).completeReservation,
                  style: AppStyles.regular16(context),
                ),
                Gap(10.h),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    S.of(context).comment,
                    style: AppStyles.semiBold14(context),
                  ),
                ),
                Gap(5.h),
                CustomEditTextFormField(
                  controller: cubit.commentController,
                  hintTxt: S.of(context).writeComment,
                ),
                Gap(10.h),
                Text(
                  S.of(context).addRate,
                  style: AppStyles.semiBold14(context),
                ),
                Gap(5.h),
                StarRating(
                  onRatingChanged: (rating) {
                    setState(() {
                      this.rating = rating;
                    });
                  },
                  starCount: 5,
                  rating: rating,
                  size: 30.0,
                  color: const Color(0xffFFCD29),
                  allowHalfRating: true,
                ),
                Gap(20.h),
                BlocBuilder<AddReviewCubit, AddReviewState>(
                  builder: (context, state) {
                    return state is AddReviewLoading
                        ? const CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          )
                        : CustomButton(
                            onPressed: () {
                              context.read<AddReviewCubit>().addReview(
                                    rating: rating,
                                    clinicId:
                                        '9397cc11-3968-4b77-9817-a2391351939c',
                                  );
                            },
                            text: S.of(context).send,
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
