
import 'package:cloud_firestore/cloud_firestore.dart';
class FirestoreServices {
  static saveUser(String name, email, uid,password) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set({'email': email, 'name': name,'password':password});
  }
}