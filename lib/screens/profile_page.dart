import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/users_service.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var sharedPref = null;

  String email = '';

  @override
  void initState() {
    super.initState();
    prepareSharedInstance();
  }

  Future<void> prepareSharedInstance() async {
    sharedPref = await SharedPreferences.getInstance();
    setState(() {
      email = sharedPref.getString("email") ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 237, 229, 151),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 236, 231, 193),
      body: FutureBuilder<DocumentSnapshot>(
        future: UsersService().getUserProfile(email),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data;
            return ListView(
              children: [
                ListTile(
                  title: const Text('Username:'),
                  subtitle: Text(data!['userName']),
                ),
                ListTile(
                  title: const Text('Email:'),
                  subtitle: Text(data['email']),
                ),
                ListTile(
                  title: const Text('User ID:'),
                  subtitle: Text(data['userId']),
                ),
                ListTile(
                  title: const Text('User Status:'),
                  subtitle: Text(data['userStatus']),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return const Text('snapshot.error');
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
