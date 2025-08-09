import 'package:aloroupia/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:aloroupia/features/home/presentation/views/widgets/drawer_widgets/contact_item.dart';
import 'package:aloroupia/features/home/presentation/views/widgets/drawer_widgets/contact_section.dart';
import 'package:aloroupia/features/home/presentation/views/widgets/home_body.dart';
import 'package:aloroupia/features/home/presentation/views/widgets/drawer_widgets/profileWidgets/profile_info.dart';
import 'package:aloroupia/generated/l10n.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHomeAppBar(),
      drawer: Drawer(child: DrawerBody()),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        slivers: [SliverToBoxAdapter(child: HomeBody())],
      ),
    );
  }
}

class DrawerBody extends StatefulWidget {
  const DrawerBody({super.key});

  @override
  State<DrawerBody> createState() => _DrawerBodyState();
}

class _DrawerBodyState extends State<DrawerBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileInfo(),
        ContactItem(
          icon: Icons.info_outline,
          text: S.of(context).about,
          onTap: () {},
        ),
        ContactItem(
          icon: Icons.logout_rounded,
          text: S.of(context).logOut,
          onTap: () {},
        ),
        SizedBox(height: 30),
        ContactSection(),
      ],
    );
  }
}
