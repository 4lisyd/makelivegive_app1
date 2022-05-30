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

  Future signUpMaker(String name, String groupName, String memberEmail) async {
    // we add their email in groups.member

    dynamic ok = db.collection("groups").doc(groupName).set({
      "members": FieldValue.arrayUnion([memberEmail])
    });

    dynamic ok2 = db
        .collection("makers")
        .doc(memberEmail)
        .set({"groupName": groupName, "name": name, "email": memberEmail});

    print(ok.toString());
  }

  setTest() {
    final user = <String, dynamic>{
      "first": "Ada",
      "last": "Lovelace",
      "born": 1815
    };
  }
}
