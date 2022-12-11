import 'package:app_firebase/services/users_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: UsersService().getUsersSnapshot(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.green,
          ));
        }

        return ListView(
          children: snapshot.data!.docs
              .map(
                (e) => Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  color: const Color.fromARGB(255, 144, 181, 213),
                  margin: const EdgeInsets.all(2),
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(e['userName']),
                    subtitle: Text('Status: ' + e['userStatus']),
                    trailing: const Icon(Icons.chat_bubble_outlined),
                    onTap: () {},
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
