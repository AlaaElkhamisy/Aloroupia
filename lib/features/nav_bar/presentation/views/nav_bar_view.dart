import 'package:aloroupia/core/manager/images/app_icons.dart';
import 'package:aloroupia/features/ai_generate/presentation/views/ai_chat_view.dart';
import 'package:aloroupia/features/chat/presentation/views/chat_view.dart';
import 'package:aloroupia/features/home/presentation/views/home_view.dart';
import 'package:aloroupia/features/notifications/presentation/views/notifications_view.dart';
import 'package:aloroupia/generated/l10n.dart';
import 'package:flutter/material.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  List<Widget> pages = [
    // Replace with your actual pages
    HomeView(),
    ChatView(),
    AiChatView(),
    NotificationsView(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomNavigationBar(),
      body: pages[currentIndex],
    );
  }

  Widget buildBottomNavigationBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildNarBarItem(
          0,
          AppIcons.fillHomeIcon,
          AppIcons.blackOutHomeIcon,
          S.of(context).home,
        ),
        buildNarBarItem(
          1,
          AppIcons.fillChatIcon,
          AppIcons.blackOutChatIcon,
          S.of(context).chat,
        ),
        buildNarBarItem(
          2,
          AppIcons.fillAiChatIcon,
          AppIcons.blackOutAiIcon,
          S.of(context).aiChat,
        ),
        buildNarBarItem(
          3,
          AppIcons.fillNotifiIcon,
          AppIcons.blackOutNotifiIcon,
          S.of(context).notifications,
        ),
      ],
    );
  }

  Widget buildNarBarItem(
    int index,
    String activeIcon,
    String inActiveIcon,
    String lable,
  ) {
    bool isSelected = currentIndex == index;
    return AnimatedContainer(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          currentIndex = index;
          setState(() {});
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              isSelected ? activeIcon : inActiveIcon,
              width: 24,
              height: 24,
            ),

            isSelected
                ? Text(
                  lable,
                  style: TextStyle(fontSize: 12, color: Colors.black),
                )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
