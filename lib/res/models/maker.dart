import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class Maker with ChangeNotifier {
  bool currentUser = false; //true if current user is maker
  String name = "";
  String email = "";
  String groupName = "";

  dynamic setMaker() {}
}
