import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class CurrentUser with ChangeNotifier {
  int currentUser = 0; //   0 = maker, 1 = leader
  String name = "";
  String email = "";
  String groupName = "kkk";

  dynamic setCurrentUser(String name, String email, String groupName) {
    this.name = name;
    this.email = email;
    this.groupName = groupName;
    notifyListeners();
  }
}
