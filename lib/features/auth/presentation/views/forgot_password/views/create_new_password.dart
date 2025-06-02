import 'package:aloroupia/features/auth/presentation/views/forgot_password/views/widgets/create_new_password_body.dart';
import 'package:flutter/material.dart';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: SafeArea(child: CreateNewPasswordBody())),
        ],
      ),
    );
  }
}
