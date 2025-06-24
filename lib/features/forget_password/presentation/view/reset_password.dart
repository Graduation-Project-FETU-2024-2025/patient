import 'package:flutter/material.dart';
import 'package:patient_app/core/widgets/custom_auth_sliver_app_bar.dart';
import 'package:patient_app/features/forget_password/presentation/view/widgets/reset_password_body.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
         const   CustomAuthSliverAppBar(),
            SliverToBoxAdapter(
              child: ResetPasswordBody(email: email,),
            )
          ],
        ),
      ),
    );
  }
}
