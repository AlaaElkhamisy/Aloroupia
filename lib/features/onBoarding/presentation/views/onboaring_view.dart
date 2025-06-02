import 'package:aloroupia/core/manager/colors/app_colors.dart';
import 'package:aloroupia/core/manager/navigation/navigation.dart';
import 'package:aloroupia/core/manager/responsive/size_config.dart';
import 'package:aloroupia/core/router/app_router.dart';
import 'package:aloroupia/features/onBoarding/presentation/views/widgets/custom_skip_widget.dart';
import 'package:aloroupia/features/onBoarding/presentation/views/widgets/get_btn.dart';
import 'package:aloroupia/features/onBoarding/presentation/views/widgets/onboarding_body.dart';
import 'package:flutter/material.dart';

class OnboaringView extends StatefulWidget {
  const OnboaringView({super.key});

  @override
  State<OnboaringView> createState() => _OnboaringViewState();
}

class _OnboaringViewState extends State<OnboaringView> {
  final PageController controller = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appbgC,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: SizeConfig.width(context, 0.0465),
              ),
              child: CustomSkipWidget(
                onTap: () {
                  //onBoardingVisited();
                  context.pushReplacementNamed(AppRouter.signUPView);
                },
              ),
            ),
            Expanded(
              child: OnBoardingBody(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.width(context, 0.0465),
              ),
              child: GetBtn(currentIndex: currentIndex, controller: controller),
            ),
          ],
        ),
      ),
    );
  }
}
