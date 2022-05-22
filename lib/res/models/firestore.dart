import 'package:flutter/foundation.dart';
// import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStore with ChangeNotifier {
  FirebaseFirestore db = FirebaseFirestore.instance;

//   await db.collection("users").get().then((event) {
//   for (var doc in event.docs) {
//     print("${doc.id} => ${doc.data()}");
//   }
// });

  int numtemp = 0;

  Future getGroups() async {
    DocumentReference<Map<String, dynamic>> querySnapshot =
        db.collection("misc_info").doc("listOfGroups");
    // print("docs len" + querySnapshot.docs.length.toString());
    // print(querySnapshot.docs[1].data());

    return await querySnapshot.get();
  }

  setTest() {
    final user = <String, dynamic>{
      "first": "Ada",
      "last": "Lovelace",
      "born": 1815
    };
  }
}
