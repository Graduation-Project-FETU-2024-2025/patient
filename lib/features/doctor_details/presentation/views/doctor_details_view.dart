import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/features/doctor_details/presentation/view_models/doctor_details/doctor_details_cubit.dart';
import 'package:patient_app/features/doctor_details/presentation/views/widgets/doctor_Sliver_app_bar.dart';
import 'package:patient_app/features/doctor_details/presentation/views/widgets/doctor_details_view_body.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DoctorDetailsCubit, DoctorDetailsState>(
        builder: (context, state) {
          if (state is DoctorDetailsSuccess) {
            return CustomScrollView(
              slivers: [
                DoctorSliverAppBar(
                  img: state.doctorModel.image ?? "",
                  isBtnValid: false,
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                SliverToBoxAdapter(
                  child: DoctorDetailsViewBody(
                    doctorModel: state.doctorModel,
                  ),
                ),
              ],
            );
          } else if (state is DoctorDetailsFailure) {
            return Center(
              child: Text(state.apiErrorModel.message!),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          }
        },
      ),
    );
  }
}
