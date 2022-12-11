import 'package:app_firebase/constants/colors.dart';
import 'package:app_firebase/widgets/popups/popup_add_friend.dart';
import 'package:app_firebase/widgets/popups/popup_start_chat.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:popup_card/popup_card.dart';
import 'package:flutter/material.dart';

class ItemLauncher extends StatefulWidget {
  final bool tabVal;
  const ItemLauncher({super.key, required this.tabVal});

  @override
  State<ItemLauncher> createState() => _ItemLauncherState();
}

class _ItemLauncherState extends State<ItemLauncher> {
  @override
  Widget build(BuildContext context) {
    return PopupItemLauncher(
      tag: 'Floating Button',
      child: Material(
        color: Color.fromARGB(255, 39, 117, 195),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: SizedBox(
          height: 50,
          width: 50,
          child: widget.tabVal
              ? const Icon(Icons.chat, size: 30)
              : const Icon(Icons.person_add_alt_outlined, size: 30),
        ),
      ),
      popUp: PopUpItem(
        padding: const EdgeInsets.all(8),
        color: const Color.fromARGB(255, 222, 209, 115),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 2,
        tag: 'Floating Button',
        child: widget.tabVal ? const PopupStartChat() : const PopUpAddFriend(),
      ),
    );
  }
}
