import 'package:flutter/material.dart';

class PopupStartChat extends StatelessWidget {
  const PopupStartChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('START CHAT'),
          const SizedBox(
            width: 50,
            height: 50,
          ),
          ElevatedButton(onPressed: () {}, child: const Text('Start Chat'))
        ],
      ),
    );
  }
}
