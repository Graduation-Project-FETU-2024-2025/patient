import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_app/features/home/presentation/views/widgets/advertising_item.dart';

class AdvertisingListView extends StatelessWidget {
  const AdvertisingListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 211.h,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return AdvertisingItem();
        },
        itemCount: 4,
      ),
    );
  }
}
