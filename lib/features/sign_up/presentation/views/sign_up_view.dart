import 'package:flutter/material.dart';
import 'package:patient_app/core/widgets/custom_auth_sliver_app_bar.dart';
import 'package:patient_app/features/sign_up/presentation/views/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomAuthSliverAppBar(),
            SliverToBoxAdapter(
              child: SignUpViewBody(),
            )
          ],
        ),
      ),
    );
  }
}
