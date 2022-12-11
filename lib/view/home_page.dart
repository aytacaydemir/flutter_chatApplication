import 'package:app_firebase/screens/chats_page.dart';
import 'package:app_firebase/screens/friends_page.dart';
import 'package:app_firebase/widgets/tabbar_home.dart';
import 'package:flutter/material.dart';
import '../widgets/floatingbutton_home.dart';
import '../widgets/popup_menu_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabValue;
  bool tabBool = true;

  @override
  void initState() {
    _tabValue = TabController(length: 2, vsync: this, initialIndex: 0);
    _tabValue?.addListener(() {
      tabBool = _tabValue?.index == 0 ? true : false;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration: const Duration(milliseconds: 500),
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: const Color.fromARGB(255, 237, 229, 151),
          foregroundColor: Colors.black,
          actions: const [
            menuButton(),
          ],
          bottom: TabBarHome(controller: _tabValue),
          title: const Text('ITouch'),
          centerTitle: true,
        ),
        body: TabBarView(
          controller: _tabValue,
          children: const [
            ChatsPage(),
            FriendsPage(),
          ],
        ),
        floatingActionButton: ItemLauncher(tabVal: tabBool),
      ),
    );
  }
}
