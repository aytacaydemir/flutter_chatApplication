import 'package:app_firebase/screens/conversation_page.dart';
import 'package:app_firebase/services/chats_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const usersArr = {
  'FpECvwcijreTjk61DvT5ZQUvopL2': 'Aytaç',
  '6zGCidmpDjYHDECPR9b7bg1Osri2': 'Ali',
};

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  var sharedPref = null;

  String _userId = '';

  @override
  void initState() {
    super.initState();
    prepareSharedInstance();
  }

  Future<void> prepareSharedInstance() async {
    sharedPref = await SharedPreferences.getInstance();
    setState(() {
      _userId = sharedPref.getString("userId") ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ChatsService().getChats(_userId),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.green,
          ));
        }

        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 236, 231, 193),
          body: ListView(
            children: snapshot.data!.docs
                .map(
                  (e) => Card(
                    margin: const EdgeInsets.all(5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    color: const Color.fromARGB(255, 139, 176, 213),
                    child: ListTile(
                      leading: const Icon(
                        Icons.chat,
                        color: Colors.black,
                      ),
                      title: Text(usersArr[_userId]!),
                      trailing: const Icon(Icons.forward),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (content) => ConversationPage(
                                    userId: _userId, conversationId: e.id)));
                      },
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
