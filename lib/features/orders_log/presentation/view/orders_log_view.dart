import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/utils/app_images.dart';
import 'package:patient_app/features/orders_log/presentation/data/models/order_model.dart';
import 'package:patient_app/features/orders_log/presentation/view/widgets/medicin_order_item.dart';
import 'package:patient_app/features/orders_log/presentation/view/widgets/order_logs_app_bar.dart';

class OrdersLogView extends StatelessWidget {
  const OrdersLogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(32.0.w),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: OrderLogsAppBar()),
              SliverToBoxAdapter(child: Gap(50.h)),
              SliverList.separated(
                separatorBuilder: (context, index) => Divider(
                  height: 20.h,
                ),
                itemCount: 3,
                itemBuilder: (context, index) => MedicineOrderItem(
                  orderModel: OrderModel(
                    medicineImage: AppImages.imagesMedicin,
                    medicineName: 'Medicine Name',
                    medicineActive: 'Beclomethasone',
                    price: '90.00',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
