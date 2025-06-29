import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_app/features/orders_log/data/models/order_model.dart';
import 'package:patient_app/features/orders_log/presentation/view/widgets/medicin_order_item.dart';



class OrderLogSuccessBody extends StatelessWidget {
  const OrderLogSuccessBody({
    super.key,
    required this.orders,
  });
  final List<OrderModel> orders;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => Divider(
        height: 20.h,
      ),
      itemCount: orders.length,
      itemBuilder: (context, index) => MedicineOrderItem(
        orderModel: orders[index],
      ),
    );
  }
}
