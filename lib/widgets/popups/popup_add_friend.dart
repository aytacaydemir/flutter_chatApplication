import 'package:flutter/material.dart';

class PopUpAddFriend extends StatelessWidget {
  const PopUpAddFriend({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('Add Friend'),
          const Divider(
            color: Colors.white,
            thickness: 0.5,
          ),
          const TextField(
            decoration: InputDecoration(labelText: 'Enter User ID here'),
          ),
          const Divider(
            color: Colors.white,
            thickness: 0.2,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Add'),
          )
        ],
      ),
    );
  }
}
