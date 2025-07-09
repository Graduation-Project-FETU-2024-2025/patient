import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/routers/routing.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/features/all_Specialities/data/models/specialities_model.dart';
import 'package:patient_app/features/home/data/models/doctor_model.dart';
import 'package:patient_app/features/home/presentation/view_models/get_top_doctors/get_top_doctors_cubit.dart';
import 'package:patient_app/features/home/presentation/views/widgets/highly_recomm_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HighlyRecommListView extends StatelessWidget {
  const HighlyRecommListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTopDoctorsCubit, GetTopDoctorsState>(
      builder: (context, state) {
        if (state is GetTopDoctorsSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routing.doctorDetailsView,
                      arguments: state.topDoctors[index].id,
                    );
                  },
                  child: HighlyRecommItem(
                    doctorModel: state.topDoctors[index],
                  ),
                ),
              );
            },
            itemCount: state.topDoctors.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          );
        } else if (state is GetTopDoctorsFailure) {
          return Center(
            child: Text(state.errorModel.message!),
          );
        } else {
          return Skeletonizer(
            enabled: true,
            effect: ShimmerEffect(
              baseColor: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.darkGray
                  : AppColors.lightGray,
            ),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: HighlyRecommItem(
                    doctorModel: DoctorModel(
                      id: 'id',
                      clinicId: 'clinicId',
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
              itemCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          );
        }
      },
    );
  }
}
