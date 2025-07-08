import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/routers/routing.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_images.dart';
import 'package:patient_app/features/Doctors/presentaion/view_models/doctors/doctors_cubit.dart';
import 'package:patient_app/features/all_Specialities/data/models/specialities_model.dart';
import 'package:patient_app/features/all_doctors/presentation/views/widgets/all_doctors_item.dart';
import 'package:patient_app/features/home/data/models/doctor_model.dart';
import 'package:patient_app/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorsCubit, DoctorsState>(
      builder: (context, state) {
        if (state is DoctorsSuccess) {
          if (state.doctors.isEmpty) {
            return Center(
              child: Column(
                children: [
                  Image.asset(AppImages.imagesNoItem),
                  Gap(20.h),
                  Text(S.of(context).noDoctorsFound),
                ],
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      Routing.doctorDetailsView,
                      arguments: state.doctors[index].id,
                    ),
                    child: AllDoctorsItem(
                      doctorModel: state.doctors[index],
                    ),
                  ),
                );
              },
              itemCount: state.doctors.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
            ),
          );
        } else if (state is DoctorsFailure) {
          return Center(
            child: Text(state.apiErrorModel.message!),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Skeletonizer(
              enabled: true,
              effect: ShimmerEffect(
                baseColor: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkGray
                    : AppColors.lightGray,
              ),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: AllDoctorsItem(
                      doctorModel: DoctorModel(
                        id: 'id',
                        price: 0,
                        fullName: 'fullName',
                        clinicName: 'clinicName',
                        clinicAddress: 'clinicAddress',
                        rating: 0,
                        reviewsCount: 0,
                        image:
                            'https://www.shutterstock.com/image-photo/portrait-handsome-male-doctor-stethoscope-600nw-2480850611.jpg',
                        phoneNumber: '',
                        nextAvailableAppointment: 'nextAvailableAppointment',
                        about: '',
                        specialization: SpecialitiesModel(
                          arName: '',
                          enName: '',
                          id: '',
                          icon: '',
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
              ),
            ),
          );
        }
      },
    );
  }
}
