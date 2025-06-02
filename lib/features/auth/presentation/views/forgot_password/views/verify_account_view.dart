import 'package:aloroupia/features/auth/presentation/views/forgot_password/views/widgets/verify_account_body.dart';
import 'package:flutter/material.dart';

class VerifyAccountView extends StatelessWidget {
  const VerifyAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: SafeArea(child: VerifyAccountBody())),
        ],
      ),
    );
  }
}
