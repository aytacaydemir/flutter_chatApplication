import 'package:flutter/material.dart';

class TabBarHome extends StatelessWidget implements PreferredSizeWidget {
  const TabBarHome({super.key, required this.controller});

  final controller;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      overlayColor: MaterialStateColor.resolveWith((states) => Colors.red),
      indicatorColor: const Color.fromARGB(255, 232, 120, 111),
      isScrollable: true,
      indicatorSize: TabBarIndicatorSize.tab,
      automaticIndicatorColorAdjustment: true,
      indicatorWeight: 5,
      enableFeedback: true,
      labelColor: Colors.black,
      tabs: const [
        Tab(
          text: 'Chats',
          icon: Icon(
            Icons.chat,
          ),
          iconMargin: EdgeInsets.all(2),
        ),
        Tab(
          text: 'Friends',
          icon: Icon(Icons.person_search_sharp),
          iconMargin: EdgeInsets.all(2),
        ),
      ],
    );
  }
}
