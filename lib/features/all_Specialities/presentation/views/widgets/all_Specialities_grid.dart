import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/routers/routing.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/features/all_Specialities/data/models/specialities_model.dart';
import 'package:patient_app/features/all_Specialities/presentation/view_models/get_all_specialites/get_all_specialities_cubit.dart';
import 'package:patient_app/features/all_Specialities/presentation/views/widgets/specialities_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AllSpecialitiesGrid extends StatelessWidget {
  const AllSpecialitiesGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllSpecialitiesCubit, GetAllSpecialitiesState>(
      builder: (context, state) {
        if (state is GetAllSpecialitiesSucess) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 3,
              childAspectRatio: 1,
            ),
            shrinkWrap: true,
            itemCount: state.specialitiesList.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  Routing.allDoctorsView,
                  arguments: state.specialitiesList[index].id,
                ),
                child: SpecialitiesItem(
                  specialitiesModel: state.specialitiesList[index],
                ),
              );
            },
          );
        } else if (state is GetAllSpecialitiesFailure) {
          return Center(
            child: Text(state.apiErrorModel.message!),
          );
        } else {
          return Skeletonizer(
            enabled: true,
            effect: ShimmerEffect(
              baseColor: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.darkGray
                  : AppColors.lightGray,
            ),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 3,
                childAspectRatio: 1,
              ),
              shrinkWrap: true,
              itemCount: 20,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return SpecialitiesItem(
                  specialitiesModel: SpecialitiesModel(
                      arName: 'arName',
                      enName: 'enName',
                      id: 'id',
                      icon: 'icon'),
                );
              },
            ),
          );
        }
      },
    );
  }
}
