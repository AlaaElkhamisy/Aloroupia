import 'package:aloroupia/features/auth/presentation/views/signUp/views/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: Column(children: [SignUpForm()])),
          ],
        ),
      ),
    );
  }
}
