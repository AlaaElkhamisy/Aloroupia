import 'package:aloroupia/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:aloroupia/features/home/presentation/views/widgets/home_body.dart';
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
      drawer: Drawer(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        slivers: [SliverToBoxAdapter(child: HomeBody())],
      ),
    );
  }
}
