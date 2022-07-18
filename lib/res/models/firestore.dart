import 'dart:ffi';

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

  Future<DocumentSnapshot> getGroupMembers(String groupName) async {
    dynamic ok =
        db.collection("groups").doc(groupName).get().then((value) => value);

    return ok;
  }

  Future<QuerySnapshot> getGroupChat(String groupName) async {
    dynamic ok = db
        .collection("groups")
        .doc(groupName)
        .collection("groupChat")
        .orderBy('timeCreated', descending: false)
        .get();
    // .doc()
    // .get();
    // .then((value) => value);

    return ok;
  }

  Future<DocumentSnapshot> getGroupData(String groupName) async {
    dynamic ok = db
        .collection("groups")
        .doc(groupName)

        // .orderBy('timeCreated', descending: false)
        .get();
    // .doc()
    // .get();
    // .then((value) => value);

    return ok;
  }

  Future getCurrentUserWithEmail(String email) {
    dynamic ok = db.collection("makers").doc(email).get();

    return ok;
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

  Future signUpLeader(String name, String groupName, String memberEmail) async {
    //  dynamic ok = db.collection("groups").doc(groupName).set({
    //   "members": FieldValue.arrayUnion([memberEmail])
    // });

    dynamic ok2 = db
        .collection("leaders")
        .doc(memberEmail)
        .set({"groupName": groupName, "name": name, "email": memberEmail});
  }

  Future sendMessageInGroup(
      String message, String sender, int senderRole, String groupName) {
    dynamic ok2 =
        db.collection("groups").doc(groupName).collection("groupChat").add({
      "message": message,
      "sender": sender,
      "senderRole": senderRole == 1 ? "leader" : "maker",
      "timeCreated": Timestamp.now(),
    });

    // .update({
    //   "groupChat": [
    //     {
    //       "message": message,
    //       "sender": sender,
    //       "senderRole": senderRole == 1 ? "leader" : "maker",
    //     }
    //   ]
    // });

    return ok2;
  }
}
