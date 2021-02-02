import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/tank.dart';

// @TODO: Read https://firebase.flutter.dev/docs/firestore/usage to have less code to add Class manage small part of code

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // Collection reference

  final CollectionReference userDataCollection =
      FirebaseFirestore.instance.collection('userData');

  Future updateUserData(
      int width, int height, int length, String name, String type) async {
    // ignore: unnecessary_await_in_return
    return await userDataCollection.doc(uid).collection('tanks').doc().set({
      'width': width,
      'height': height,
      'length': length,
      'name': name,
      'type': type
    });
  }

  // tank list from snapshot
  List<Tank> _tankListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Tank(
        id: doc.reference.id,
        height: doc.data()['height'] ?? 0,
        width: doc.data()['width'] ?? 0,
        length: doc.data()['length'] ?? 0,
        name: doc.data()['name'] ?? '',
        type: doc.data()['type'] ?? '',
      );
    }).toList();
  }

  Stream<List<Tank>> get tanks {
    final User user = FirebaseAuth.instance.currentUser;

    return userDataCollection
        .doc(user.uid)
        .collection('tanks')
        .snapshots()
        .map(_tankListFromSnapshot);
  }
}
