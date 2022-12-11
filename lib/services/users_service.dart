import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersService {
  final FirebaseFirestore _database = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> getUsersSnapshot() {
    return _database.collection('users').orderBy('userName').snapshots();
  }

  Future<DocumentSnapshot> getUserProfile(String email) async {
    final userRef = FirebaseFirestore.instance.collection('users');
    final querySnapshot = await userRef.where('email', isEqualTo: email).get();

    return querySnapshot.docs[0];
  }

  Future<DocumentSnapshot?> saveUserDataToPreferences() async {
    final pref = await SharedPreferences.getInstance();
    final email = pref.getString('email');

    final userRef = FirebaseFirestore.instance.collection('users');
    final querySnapshot = await userRef.where('email', isEqualTo: email).get();

    final userName = querySnapshot.docs[0]["userName"];
    final userId = querySnapshot.docs[0]["userId"];

    var sharedPrefs = await SharedPreferences.getInstance();

    sharedPrefs.setString("userId", userId);
    sharedPrefs.setString("userName", userName);

    return null;
  }

  Future<String> getOtherMemberName(String userId) async {
    final pref = await SharedPreferences.getInstance();
    final userId = pref.getString('userId');

    final userRef = FirebaseFirestore.instance.collection('users');
    final querySnapshot =
        await userRef.where('userId', isEqualTo: userId).get();

    final userId1 = querySnapshot.docs[0]["userName"];

    return userId1;
  }
}
