import 'package:aloroupia/features/auth/presentation/views/logIn/views/widgets/log_in_form.dart';
import 'package:aloroupia/features/auth/presentation/views/logIn/views/widgets/top_side_container_login.dart';
import 'package:flutter/material.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(children: [TopSideContainerLogIn(), LogInForm()]),
          ),
        ],
      ),
    );
  }
}
