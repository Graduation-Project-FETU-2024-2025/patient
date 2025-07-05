import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/services/get_it.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_styles.dart';
import 'package:patient_app/core/widgets/custom_button.dart';
import 'package:patient_app/core/widgets/custom_edit_text_form_field.dart';
import 'package:patient_app/core/widgets/toast.dart';
import 'package:patient_app/features/home/data/models/doctor_model.dart';
import 'package:patient_app/features/make_appointment/data/repos/add_review_repo.dart';
import 'package:patient_app/features/make_appointment/presentation/view_models/add_review/add_review_cubit.dart';
import 'package:patient_app/features/make_appointment/presentation/view_models/make_appointment/make_appointment_cubit.dart';
import 'package:patient_app/features/make_appointment/presentation/views/widgets/date_field.dart';
import 'package:patient_app/features/make_appointment/presentation/views/widgets/make_appointment_app_bar.dart';
import 'package:patient_app/features/make_appointment/presentation/views/widgets/pick_file_section.dart';
import 'package:patient_app/features/make_appointment/presentation/views/widgets/review_dialog.dart';
import 'package:patient_app/features/make_appointment/presentation/views/widgets/time_section.dart';
import 'package:patient_app/generated/l10n.dart';

class MakeAppointmentViewBody extends StatelessWidget {
  MakeAppointmentViewBody({super.key, required this.doctorModel});
  final List<String> timeSlots = [
    '08:00 AM',
    '09:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 AM',
    '3:00 PM',
  ];
  final DoctorModel doctorModel;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MakeAppointmentCubit>();
    return SingleChildScrollView(
      child: Column(
        children: [
          const MakeAppointmentAppBar(),
          Gap(30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).date,
                  style: AppStyles.semiBold14(context),
                ),
                Gap(10.h),
                const DateField(),
                Gap(30.h),
                TimeSection(cubit: cubit, timeSlots: timeSlots),
                Gap(50.h),
                Text(
                  S.of(context).commentAndNotes,
                  style: AppStyles.semiBold14(context),
                ),
                Gap(10.h),
                CustomEditTextFormField(
                  controller: cubit.commentConroller,
                  hintTxt: S.of(context).writeNote,
                  maxLines: 8,
                ),
                Gap(50.h),
                PickFileSection(cubit: cubit),
                Gap(80.h),
                Align(
                  alignment: Alignment.center,
                  child:
                      BlocConsumer<MakeAppointmentCubit, MakeAppointmentState>(
                    listener: (context, state) {
                      if (state is MakeAppointmentSuccess) {
                        successToast(message: S.of(context).successfully);
                        showReviewdialog(context);
                      }
                      if (state is MakeAppointmentFailure) {
                        errorToast(message: state.apiErrorModel.message!);
                      }
                    },
                    builder: (context, state) {
                      return state is MakeAppointmentLoading
                          ? const CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            )
                          : CustomButton(
                              onPressed: () {
                                cubit.makeAppointment(
                                  doctorName: doctorModel.fullName,
                                  clinicId: doctorModel.id,
                                );
                              },
                              text: S.of(context).book,
                            );
                    },
                  ),
                ),
                Gap(50.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showReviewdialog(BuildContext context) {
    return showDialog(
        barrierColor: Theme.of(context).brightness == Brightness.dark
            ? AppColors.white.withValues(alpha: 0.4)
            : AppColors.black.withValues(alpha: 0.4),
        context: context,
        builder: (context) {
          return BlocProvider(
            create: (context) => AddReviewCubit(getIt<AddReviewRepo>()),
            child: BlocConsumer<AddReviewCubit, AddReviewState>(
              listener: (context, state) {
                if (state is AddReviewSuccess) {
                  successToast(message: S.of(context).addreviewSuccessfully);
                  Navigator.pop(context);
                }
                if (state is AddReviewFailure) {
                  errorToast(message: state.apiErrorModel.message!);
                }
              },
              builder: (context, state) {
                return const ReviewDialog();
              },
            ),
          );
        });
  }
}
