import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/about_app_page.dart';
import '../screens/login_page.dart';
import '../screens/profile_page.dart';

class menuButton extends StatelessWidget {
  const menuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      iconSize: 28,
      icon: const Icon(Icons.settings),
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          value: 1,
          onTap: () {}, //profile
          child: Row(
            children: const <Widget>[
              Icon(
                Icons.account_circle,
                //color: ColorsTheme.tertiary,
              ),
              Text("Profile"),
            ],
          ),
        ),
        PopupMenuItem(
          //Log out
          value: 2,

          child: Row(
            children: const [
              Icon(
                Icons.logout,
                color: Colors.black,
              ),
              Text("Log Out")
            ],
          ),
        ),
        PopupMenuItem(
          value: 3,
          //About the App
          child: Row(
            children: const [
              Icon(
                Icons.info,
                color: Colors.black,
              ),
              Text("About App"),
            ],
          ),
        ),
      ],
      onSelected: (value) async {
        if (value == 1) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ProfilePage()));
        } else if (value == 2) {
          final pref = await SharedPreferences.getInstance();
          pref.setBool('LoginKey', false);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        } else if (value == 3) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AboutAppPage(),
          ));
        }
      },
    );
  }
}
