import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterdev/Models/datamod.dart';

class DatabaseService {
  final CollectionReference userdetailCollection =
      Firestore.instance.collection('userspecifics');
  //final String uid;
  static String ud = '';
  //DatabaseService({this.uid});

  Future updateUserData(
      String name, String age, String height, String weight) async {
    return await userdetailCollection.document(ud).setData({
      'uid': ud,
      'name': name,
      'age': age,
      'height': height,
      'weight': weight,
    });
  }

  //dataobject from the snapshot
  List<Datamod> userDataFromSnapshot(QuerySnapshot snapshot) {
    print("This is it $ud");
    return snapshot.documents.map(
      (doc) {
        if (doc.data['uid'] == ud) {
          return Datamod(
            uid: doc.data['uid'] ?? '',
            name: doc.data['name'] ?? '',
            age: doc.data['age'] ?? '',
            height: doc.data['height'] ?? '',
            weight: doc.data['weight'] ?? '',
          );
        } 
        else {
          return null;
        }
      },
    ).toList();
  }

  Stream<List<Datamod>> get userspecfics {
    return userdetailCollection.snapshots().map(userDataFromSnapshot);
  }
  /*Stream<List<Datamod>> get userspecfics{
    return userdetailCollection.snapshots().map((snapShot) => snapShot.documents
        .map((document) => Datamod.fromJson(document.data))
        .toList());
  }*/
}
