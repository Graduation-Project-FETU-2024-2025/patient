import 'package:flutter/material.dart';
import 'package:patient_app/features/home/presentation/views/widgets/highly_recomm_item.dart';

class HighlyRecommListView extends StatelessWidget {
  const HighlyRecommListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(
            bottom: 20,
          ),
          child: HighlyRecommItem(),
        );
      },
      itemCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
