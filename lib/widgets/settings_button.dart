import 'package:app_firebase/screens/about_app_page.dart';
import 'package:flutter/material.dart';

class SettingsButton extends StatefulWidget {
  const SettingsButton({super.key});

  @override
  State<SettingsButton> createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton> {
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      iconSize: 28,
      icon: Icon(Icons.settings),
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          value: 1,
          onTap: () {}, //profile
          child: Row(
            children: const <Widget>[
              Icon(
                Icons.account_circle,
                color: Colors.black,
              ),
              Text("Profile"),
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          onTap: () {}, //Log out
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
          //About the App
          value: 3,
          onTap: () {},
          child: Row(
            children: const [
              Icon(
                Icons.info,
                color: Colors.black,
              ),
              Text("About App")
            ],
          ),
        ),
      ],
      onSelected: (value) {
        if (value == 1) {
        } else if (value == 2) {
        } else if (value == 3) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AboutAppPage(),
          ));
        }
      },
    );
  }
}
