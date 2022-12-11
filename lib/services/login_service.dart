import 'package:cloud_firestore/cloud_firestore.dart';

class LoginService {
  Future<bool> checkUser(String email, String password) async {
    final dbRef = FirebaseFirestore.instance.collection('users');
    final querySnapshot = await dbRef
        .where('email', isEqualTo: email)
        .where('password', isEqualTo: password)
        .get();
    return querySnapshot.docs.isNotEmpty; //user exist
  }
}
