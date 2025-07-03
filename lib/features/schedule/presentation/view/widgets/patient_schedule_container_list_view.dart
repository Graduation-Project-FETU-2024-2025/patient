import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/helpers/extentions.dart';
import 'package:patient_app/core/routers/routing.dart';
import 'package:patient_app/features/schedule/presentation/view_model/order_schedule/order_schedule_cubit.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/appointment_model.dart';
import 'patient_schedule_container.dart';

class PatientScheduleContainerListView extends StatelessWidget {
  const PatientScheduleContainerListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = const [
      Color(0xffF28A51),
      Color(0xff4169E1),
      Color(0xff05B56F),
    ];

    return BlocBuilder<OrderScheduleCubit, OrderScheduleState>(
      builder: (context, state) {
        if (state is OrderScheduleLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is OrderScheduleFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.message)),
          );
        } else if (state is OrderScheduleSuccess) {
          final List<AppointmentModel> appointments = state.orders;

          if (appointments.isEmpty) {
            return SliverToBoxAdapter(
              child: Center(child: Text(S.of(context).noAppointment)),
            );
          }

          return SliverList.builder(
            itemCount: appointments.length,
            itemBuilder: (context, index) {
              final appointment = appointments[index];
              final color = colors[index % colors.length];

              return GestureDetector(
                onTap: () {
                  context.pushNamed(Routing.appointmentDetail,
                      argument: appointment);
                },
                child: PatientScheduleContainer(
                  backgroundColor: color,
                  appointmentModel: appointment,
                ),
              );
            },
          );
        }

        return const SliverToBoxAdapter(child: SizedBox());
      },
    );
  }
}
