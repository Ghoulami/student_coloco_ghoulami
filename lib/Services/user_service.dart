import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:student_coloco_ghoulami/models/user.dart';

class UserServices {
  // collection reference
  final CollectionReference userCollection = Firestore.instance.collection('Users');

  final String uid;
  UserServices({ this.uid });

  Future<void> addUserData(User user) async {
    return await userCollection.document(uid).setData({
      'uid' : uid,
      'last_name': user.last_name,
      'fist_name': user.fist_name,
      'emial': user.email,
      'favorits' : null,
    });
  }

  Future<DocumentReference> getUserDoc() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final Firestore _firestore = Firestore.instance;
    FirebaseUser user = await _auth.currentUser();
    DocumentReference ref = _firestore.collection('users').document(user.uid);
    return ref;
  }

  Future<String> getUserId() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseUser user = await _auth.currentUser();
    String uId = user.uid.toString();
    return uId;
  }
}