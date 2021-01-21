import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_reef/models/tank.dart';

// @TODO: Read https://firebase.flutter.dev/docs/firestore/usage to have less code to add Class manage small part of code

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // Collection reference

  final CollectionReference tankCollection =
      FirebaseFirestore.instance.collection('tanks');

  Future updateUserData(
      int width, int height, int lenght, String name, String type) async {
    return await tankCollection.doc(uid).set({
      'width': width,
      'height': height,
      'lenght': lenght,
      'name': name,
      'type': type
    });
  }

  // tank list from snapshot
  List<Tank> _tankListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Tank(
        height: doc.data()['height'] ?? 0,
        width: doc.data()['width'] ?? 0,
        lenght: doc.data()['lenght'] ?? 0,
        name: doc.data()['name'] ?? '',
        type: doc.data()['type'] ?? '',
      );
    }).toList();
  }

  Stream<List<Tank>> get tanks {
    return tankCollection.snapshots().map(_tankListFromSnapshot);
  }
}
