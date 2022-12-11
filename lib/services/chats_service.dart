import 'package:cloud_firestore/cloud_firestore.dart';

class ChatsService {
  final FirebaseFirestore _database = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> getChats(String userId) {
    return _database
        .collection('chats')
        .where('members', arrayContains: userId)
        .snapshots();
  }
}
