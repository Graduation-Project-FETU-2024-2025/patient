import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_date_timeline.dart';
import '../../../../generated/l10n.dart';
import '../view_model/order_schedule/order_schedule_cubit.dart';
import 'widgets/patient_schedule_container_list_view.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 10.0.h),
        child: RefreshIndicator(
          color: AppColors.primaryColor,
          onRefresh: () async {
            context.read<OrderScheduleCubit>().fetchAppointments();
          },
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: Gap(50.h)),
              SliverToBoxAdapter(
                child: Text(
                  S.of(context).today,
                  style: AppStyles.semiBold18(context),
                ),
              ),
              SliverToBoxAdapter(child: Gap(30.h)),
              SliverToBoxAdapter(child: CustomDateTimeline(
                onDateChange: (date) {
                  context.read<OrderScheduleCubit>().changeSelectedDate(date);
                },
              )),
              SliverToBoxAdapter(child: Gap(30.h)),
              const PatientScheduleContainerListView(),
              SliverToBoxAdapter(
                child: Gap(30.h),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
