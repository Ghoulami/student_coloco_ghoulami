import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_coloco_ghoulami/models/user.dart';

class UserServices {

  // collection reference
  final CollectionReference userCollection = Firestore.instance.collection('Users');

  final String uid;
  UserServices({ this.uid });

  Future<void> updateUserData(User user) async {
    return await userCollection.document(uid).setData({
      'uid' : uid,
      'last_name': user.last_name,
      'fist_name': user.fist_name,
      'emial': user.email,
      'favorits' : null,
    });
  }
}