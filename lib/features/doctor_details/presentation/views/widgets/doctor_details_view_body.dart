import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/routers/routing.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_styles.dart';
import 'package:patient_app/core/widgets/custom_button.dart';
import 'package:patient_app/features/doctor_details/presentation/views/widgets/about_doctor.dart';
import 'package:patient_app/features/doctor_details/presentation/views/widgets/booking_section.dart';
import 'package:patient_app/features/doctor_details/presentation/views/widgets/doctor_info.dart';
import 'package:patient_app/features/home/data/models/doctor_model.dart';
import 'package:patient_app/generated/l10n.dart';

class DoctorDetailsViewBody extends StatelessWidget {
  const DoctorDetailsViewBody({super.key, required this.doctorModel});
  final DoctorModel doctorModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 30.w, left: 30.w, top: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 85,
                height: 12,
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.black.withValues(alpha: 0.3)
                      : AppColors.white.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ],
          ),
          Gap(40.h),
          Text(
            doctorModel.clinicName ?? '',
            style: AppStyles.semiBold25(context).copyWith(
              fontSize: 24,
              color: AppColors.primaryColor,
            ),
          ),
          Gap(10.h),
          Text(
            "Dr. ${doctorModel.fullName}",
            style: AppStyles.semiBold14(context).copyWith(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.black.withValues(alpha: 0.4)
                  : AppColors.white.withValues(alpha: 0.4),
            ),
          ),
          Gap(40.h),
          DoctorInfo(
            doctorModel: doctorModel,
          ),
          Gap(80.h),
          AboutDoctor(
            aboutDoctor: doctorModel.about ?? 'N/A',
          ),
          Gap(40.h),
          BookingSection(
            doctorModel: doctorModel,
          ),
          Gap(80.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                onPressed: () => Navigator.pushNamed(
                    context, Routing.makeAppointment,
                    arguments: doctorModel),
                text: S.of(context).makeAnAppointment,
              ),
            ],
          ),
          Gap(40.h),
        ],
      ),
    );
  }
}
