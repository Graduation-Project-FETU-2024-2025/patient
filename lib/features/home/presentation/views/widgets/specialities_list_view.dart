import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_app/core/routers/routing.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/features/all_Specialities/data/models/specialities_model.dart';
import 'package:patient_app/features/home/presentation/view_models/get_specialites/get_specialities_cubit.dart';
import 'package:patient_app/features/home/presentation/views/widgets/specialities_item.dart';
import 'package:patient_app/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SpecialtiesListView extends StatelessWidget {
  const SpecialtiesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSpecialitiesCubit, GetSpecialitiesState>(
      builder: (context, state) {
        if (state is GetSpecialitiesSuccess) {
          return SizedBox(
            height: 100.h,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    Routing.allDoctorsView,
                    arguments: state.specialities[index].id,
                  ),
                  child: SpecialitiesItem(
                    specialitiesModel: state.specialities[index],
                  ),
                );
              },
              itemCount: state.specialities.length,
            ),
          );
        } else if (state is GetSpecialitiesError) {
          return Center(
            child: Text(
                state.errorModel.message ?? S.of(context).someThingWentWrong),
          );
        } else {
          return Skeletonizer(
            enabled: true,
            effect: ShimmerEffect(
              baseColor: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.darkGray
                  : AppColors.lightGray,
            ),
            child: SizedBox(
              height: 100.h,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SpecialitiesItem(
                    specialitiesModel: SpecialitiesModel(
                      arName: '',
                      enName: '',
                      id: '',
                      icon: '',
                    ),
                  );
                },
                itemCount: 6,
              ),
            ),
          );
        }
      },
    );
  }
}
